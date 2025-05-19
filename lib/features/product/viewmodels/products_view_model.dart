import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:landmark_assignment/features/product/models/repo/repository/product_repository.dart';
import 'package:landmark_assignment/features/product/views/screens/product_details_screen.dart';

@singleton
class ProductsViewModel extends BaseViewModel {
  final className = "ProductsViewModel";

  RxString selectedCategories = "All Categories".obs;
  RxList<String> categories = <String>[].obs;
  RxList<ProductData> filteredProducts = <ProductData>[].obs;
  RxBool isLoadingMore = false.obs;
  RxBool isFetching = false.obs;
  int _currentPage = 1;
  int _perPage = 10;
  String errorMsg="";
  late List<ProductData> _allProducts;
  RxList allProducts =[].obs;


  onSelectedItem(ProductData productData){
    push(ProductDetailsScreen(productData:productData,filteredProducts: filteredProducts,viewModel: this,));
}
  onSelectedSuggestedItem(ProductData productData){
    pushReplacement(ProductDetailsScreen(productData:productData,filteredProducts: filteredProducts,viewModel: this,));
  }
  void loadMoreProducts() async {
    if (isLoadingMore.value) return;
    isLoadingMore.value = true;
    await Future.delayed(const Duration(seconds: 2));

    final nextItems = _currentFilteredList.skip(_currentPage * _perPage).take(_perPage).toList();
    if (nextItems.isNotEmpty) {
      filteredProducts.addAll(nextItems);
      _currentPage++;
    }
    isLoadingMore.value = false;
  }

  late List<ProductData> _currentFilteredList; // Add this

  void filterProductsByCategory(String category) {
    selectedCategories.value = category;
    _currentPage = 1;

    _currentFilteredList = category == "All Categories"
        ? _allProducts
        : _allProducts.where((p) => p.category == category).toList();

    filteredProducts.value = _currentFilteredList.take(_perPage).toList();
  }



  List<String> _extractCategories(List<ProductData> products) {
    final uniqueCategories = <String>{};
    for (var product in products) {
      uniqueCategories.add(product.category);
    }
    return ["All Categories", ...uniqueCategories];
  }


  Future<void> fetchProducts() async {
    try {
      isFetching.value = true;
      ProductModel model = await ProductRepository().getAllProducts();
      isFetching.value = false;
      if (model.statusCode == 200) {
        _allProducts = model.productModelList!;
        allProducts.value = model.productModelList!;
        categories.addAll(_extractCategories(_allProducts));
        filterProductsByCategory("All Categories");
      }
      else{
        errorMsg = model.statusMsg!;
      }
    } catch (e) {
      loge(tag: className, message: "fetchProducts error: $e");
    }
  }

  Future<void> addProductCart(ProductData productData) async {
    try {
      CartModel cartModelReuquest = CartModel(id: generateRandomNumberInt(10),
          userId: GlobalVariables.userID,
          cartList: [CartItem(
              id: productData.id,
              title: productData.title,
              price: productData.price,
              description: productData.description,
              category: productData.category,
              image: productData.image)]);
      showCircularIndicator(message: "Please wait");
      CartModel model = await ProductRepository().addProductCart(cartModelReuquest);
      dismissDialogIndicator();
      // if (model.statusCode == 200) {
      //   _allProducts = model.cartList!;
      //   categories.addAll(_extractCategories(_allProducts));
      //   filterProductsByCategory("All Categories");
      // }
    } catch (e) {
      loge(tag: className, message: "fetchProducts error: $e");
    }
  }


}
