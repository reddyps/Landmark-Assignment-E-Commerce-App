import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:landmark_assignment/core/network/network_call.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_handler.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/features/order/models/model/orders/orders_model.dart';

import '../model/orders/payment_model.dart';
class PaymentRepository{
  final className="PaymentRepository";
  static final PaymentRepository _singleton =  PaymentRepository._internal();

  PaymentRepository._internal();

  factory PaymentRepository() {
    return _singleton;
  }

   createPaymentIntent(PaymentModel request) async {
    logD(message: "createPaymentIntent");
     var response;
    try {
      if(Constants.isHardcodeResponse){
        response = await hardcodeResponse(hardcodeApi: HardcodeApis.getAllProducts,
            fromJson: OrdersModel.fromJson);
      }
      else{
        await callApi(
          options: Options(headers:  {
            'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },),
          request: request,
          baseURL: APIEndPoints.paymentBasedURL,
            endPoint: APIEndPoints.paymentIntent,
            failed: (statusCode, errorDesc) {
              response = "$statusCode + $errorDesc";
            },
            success: (response){
              response = json.decode(response.body);
            },
            networkRequestType: NetworkRequestType.post);
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}

