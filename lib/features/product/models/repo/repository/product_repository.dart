import 'dart:convert';

import 'package:landmark_assignment/core/network/network_call.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_handler.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
class ProductRepository{
  final className="ProductRepository";
  static final ProductRepository _singleton =  ProductRepository._internal();

  ProductRepository._internal();

  factory ProductRepository() {
    return _singleton;
  }

  Future<ProductModel> getAllProducts() async {
    logD(message: "getAllProducts");
    late ProductModel productModel;
    try {
      if(Constants.isHardcodeResponse){
        productModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: ProductModel.fromJson);
      }
      else{
        await callApi(
            endPoint: APIEndPoints.getAllProducts,
            failed: (statusCode, errorDesc) {
              productModel = ProductModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){
              final List<dynamic> jsonList = jsonDecode(jsonEncode(response));
              final List<ProductData> productList = jsonList
                  .map((e) => ProductData.fromJson(e as Map<String, dynamic>))
                  .toList();
              productModel = ProductModel(statusCode: 200, productModelList: productList);
            },
            networkRequestType: NetworkRequestType.get);
      }
      return productModel;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<CartModel> addProductCart(CartModel request) async {
    logD(message: "addProductCart");
    logD(message: "${request.toJson()}");
    late CartModel cartModel;
    try {
      if(Constants.isHardcodeResponse){
        cartModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: CartModel.fromJson);
      }
      else{
        await callApi(
            endPoint: APIEndPoints.addProductCart,
            failed: (statusCode, errorDesc) {
              cartModel = CartModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){
              cartModel = CartModel.fromJson(response);
            },
            request: request,
            networkRequestType: NetworkRequestType.post);
      }
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

}

