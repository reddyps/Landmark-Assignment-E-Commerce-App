import 'dart:convert';

import 'package:landmark_assignment/core/network/network_call.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_handler.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';
import 'package:landmark_assignment/features/product/models/model/cart/cart_model.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
class OrdersRepository{
  final className="ProductRepository";
  static final OrdersRepository _singleton =  OrdersRepository._internal();

  OrdersRepository._internal();

  factory OrdersRepository() {
    return _singleton;
  }

  Future<OrdersModel> getAllOrders() async {
    logD(message: "getAllOrders");
    late OrdersModel ordersModel;
    try {
      if(Constants.isHardcodeResponse){
        ordersModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: OrdersModel.fromJson);
      }
      else{
        await callApi(
            endPoint: APIEndPoints.getAllOrders,
            failed: (statusCode, errorDesc) {
              ordersModel = OrdersModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){

              final List<dynamic> jsonList = jsonDecode(jsonEncode(response));
              final List<UserOrders> ordersList = jsonList
                  .map((e) => UserOrders.fromJson(e as Map<String, dynamic>))
                  .toList();
              ordersModel = OrdersModel(statusCode: 200, userOrders: ordersList);
            },
            networkRequestType: NetworkRequestType.get);
      }
      return ordersModel;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OrdersModel> cancelOrder(UserOrders request) async {
    logD(message: "cancelOrder");
    late OrdersModel ordersModel;
    try {
      if(Constants.isHardcodeResponse){
        ordersModel = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: OrdersModel.fromJson);
      }
      else{
        await callApi(
            request: request,
            endPoint: "${APIEndPoints.getAllOrders}/${request.userId}",
            failed: (statusCode, errorDesc) {
              ordersModel = OrdersModel(statusCode: statusCode, statusMsg: errorDesc);
            },
            success: (response){
              final Map<String, dynamic> jsonMap = jsonDecode(jsonEncode(response));
              final userOrder = UserOrders.fromJson(jsonMap);
              ordersModel = OrdersModel(statusCode: 200, userOrders: [userOrder]);
              },
            networkRequestType: NetworkRequestType.put);
      }
      return ordersModel;
    } catch (e) {
      throw e.toString();
    }
  }


}

