import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:landmark_assignment/core/network/network_call.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_handler.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';

import '../model/clientSecret/client_secret_model.dart';
import '../model/orders/payment_model.dart';
class PaymentRepository{
  final className="PaymentRepository";
  static final PaymentRepository _singleton =  PaymentRepository._internal();

  PaymentRepository._internal();

  factory PaymentRepository() {
    return _singleton;
  }

  Future<ClientSecretModel>  createPaymentIntent(PaymentModel request) async {
    logD(message: "createPaymentIntent");
    late ClientSecretModel clientSecretModel;
    try {
      await callApi(
          options: Options(headers:  {'Content-Type': 'application/json'}),
          request: request,
          baseURL: APIEndPoints.paymentBasedURL,
          endPoint: APIEndPoints.paymentIntent,
          failed: (statusCode, errorDesc) {
            clientSecretModel = ClientSecretModel(statusCode: statusCode, errorDesc: errorDesc);
          },
          success: (responseServer){
            clientSecretModel = ClientSecretModel.fromJson(jsonDecode(jsonEncode(responseServer)));
          },
          networkRequestType: NetworkRequestType.post);
      return clientSecretModel;
    } catch (e) {
      throw e.toString();
    }
  }
}

