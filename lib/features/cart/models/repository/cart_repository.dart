
import 'dart:convert';

import 'package:landmark_assignment/core/network/network_call.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_handler.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/cart/models/model/orders/cart_model.dart';

class CartRepository{
  final className="CartRepository";
  static final CartRepository _singleton =  CartRepository._internal();

  CartRepository._internal();

  factory CartRepository() {
    return _singleton;
  }

  Future<CartModel> getCartDetails() async {
    logD(message: "getAllOrders");
    late CartModel cartModel;
    try {
      if(Constants.isHardcodeResponse){
        cartModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: CartModel.fromJson);
      }
      else{
        await callApi(
            endPoint: APIEndPoints.getAllOrders,
            failed: (statusCode, errorDesc) {
              cartModel = CartModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){

              final List<dynamic> jsonList = jsonDecode(jsonEncode(response));
              final List<UserCart> cartList = jsonList
                  .map((e) => UserCart.fromJson(e as Map<String, dynamic>))
                  .toList();
              cartModel = CartModel(statusCode: 200, userCart: cartList);
            },
            networkRequestType: NetworkRequestType.get);
      }
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<CartModel> removeItemFromCart(UserCart request) async {
    logD(message: "removeItemFromCart");
    late CartModel cartModel;
    try {
      if(Constants.isHardcodeResponse){
        cartModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: CartModel.fromJson);
      }
      else{
        await callApi(
            request: request,
            endPoint: "${APIEndPoints.getAllOrders}/${request.userId}",
            failed: (statusCode, errorDesc) {
              cartModel = CartModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){
              final Map<String, dynamic> jsonMap = jsonDecode(jsonEncode(response));
              final userCart = UserCart.fromJson(jsonMap);
              cartModel = CartModel(statusCode: 200, userCart: [userCart]);
            },
            networkRequestType: NetworkRequestType.put);
      }
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }
}

