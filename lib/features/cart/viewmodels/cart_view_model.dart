import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/features/cart/models/model/orders/cart_model.dart';
import 'package:landmark_assignment/features/cart/models/repository/cart_repository.dart';

@singleton
class CartViewModel extends BaseViewModel {
  final className = "CartViewModel";

  List<UserCart> userCart = [];
  int userIndex = 0;

  double totalAmount = 0;

  String errorMsg="";

  Future<void> fetchAllCart() async {
    try {
      CartModel model = await CartRepository().getCartDetails();
      if (model.statusCode == 200) {
        userCart = model.userCart!
            .map((order) => order.copyWith(products: List<Products>.from(order.products ?? [])))
            .toList();
      }
      else{
        errorMsg = model.statusMsg!;
      }
    } catch (e) {
      loge(tag: className, message: "fetchProducts error: $e");
    }
  }

  Future<void> orderCart() async {
    try {
      if(totalAmount == 0){
        showSnackBar(message: "Please select the items");
        return;
      }
      if (userCart.isEmpty) return;
      final cart = userCart[userIndex];
      final updatedCart = List<Products>.from(cart.products ?? [])
        ..removeWhere((p) => p.isSelected == false);
      userCart[userIndex] = cart.copyWith(products: updatedCart);
      showCircularIndicator(message: "Placing order, Please Wait...!");
      final responseModel = await CartRepository().removeItemFromCart(
        cart.copyWith(products: updatedCart),
      );
      dismissDialogIndicator();
      if (responseModel.statusCode == 200 && responseModel.userCart != null) {
        userCart[userIndex] = responseModel.userCart!.first;
      }
    } catch (e) {
      dismissDialogIndicator();
      loge(tag: className, message: "removeItemFromCart error: $e");
    }
  }

  Future<void> removeItemFromCart(Products product) async {
    try {
      if (userCart.isEmpty) return;

      final cart = userCart[userIndex];
      final updatedCart = List<Products>.from(cart.products ?? [])
        ..removeWhere((p) => p.productId == product.productId);

      userCart[userIndex] = cart.copyWith(products: updatedCart);

      showCircularIndicator(message: "Removing item...");
      final responseModel = await CartRepository().removeItemFromCart(
        cart.copyWith(products: updatedCart),
      );
      dismissDialogIndicator();

      if (responseModel.statusCode == 200 && responseModel.userCart != null) {
        userCart[userIndex] = responseModel.userCart!.first;
      }
      calculateAmount();
    } catch (e) {
      dismissDialogIndicator();
      loge(tag: className, message: "removeItemFromCart error: $e");
    }
  }

   updateQuantity(Products product) async {
    final cart = userCart[userIndex];
    final updatedProducts = cart.products!.map((p) {
      if (p.productId == product.productId) {
        return p.copyWith(quantity: product.quantity, price: product.price);
      }
      return p;
    }).toList();
    userCart[userIndex] = cart.copyWith(products: updatedProducts);
    calculateAmount();
  }


   updateSelection(Products product) async {
    final cart = userCart[userIndex];
    final updatedProducts = cart.products!.map((p) {
      if (p.productId == product.productId) {
        return p.copyWith(isSelected: product.isSelected, price: product.price);
      }
      return p;
    }).toList();
    userCart[userIndex] = cart.copyWith(products: updatedProducts);
    calculateAmount();
  }


  void calculateAmount() {
    double amount = 0;
    final cart = userCart[userIndex];

    for (final product in cart.products ?? []) {
      if (product.isSelected) {
        amount += (product.price ?? 0) * (product.quantity ?? 1);
      }
    }
    totalAmount = amount;
  }

  @override
  void dispose() {
    super.dispose();
  }
}


