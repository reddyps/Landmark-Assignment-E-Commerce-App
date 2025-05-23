import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
import 'package:landmark_assignment/features/order/models/repository/orders_repository.dart';


@singleton
class OrdersViewModel extends BaseViewModel { // Changed to ChangeNotifier
  final className = "OrdersViewModel";

  List<UserOrders> userOrders = [];         // Final copy to bind to UI
  List<UserOrders> _originalOrders = [];
  int userIndex=0;

  Future<void> fetchAllOrders() async {
    try {
      OrdersModel model = await OrdersRepository().getAllOrders();
      if (model.statusCode == 200) {
        _originalOrders = model.userOrders!;
        userOrders = model.userOrders!
            .map((order) => order.copyWith(products: List<Products>.from(order.products ?? [])))
            .toList();
      }
    } catch (e) {
      loge(tag: className, message: "fetchProducts error: $e");
    }
  }


  Future<void> onClickOrderCancel(Products product) async {
    try {
      if (userOrders.isEmpty) return;
      final userOrder = userOrders[0];
      final updatedProducts = List<Products>.from(userOrder.products ?? []);
      updatedProducts.removeWhere((p) => p.productId == product.productId);
      userOrders[0] = userOrder.copyWith(products: updatedProducts);
      showCircularIndicator(message: "Please wait...!");
      final responseModel = await OrdersRepository().cancelOrder(
        userOrder.copyWith(products: updatedProducts),
      );
      dismissDialogIndicator();
      if(responseModel.statusCode == 200){
        if (responseModel.userOrders != null && responseModel.userOrders!.isNotEmpty) {
          userOrders[0] = responseModel.userOrders!.first;
        }
      }
    } catch (e) {
      dismissDialogIndicator();
      loge(tag: className, message: "onClickOrderCancel error: $e");
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}

