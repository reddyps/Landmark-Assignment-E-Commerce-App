import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:landmark_assignment/core/models/networkmodel/network_model.dart';
import 'package:landmark_assignment/core/network/network_request_type.dart';
import 'package:landmark_assignment/core/network/network_service.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';

Future<void> callApi<T>({
  NetworkRequestType? networkRequestType,
  dynamic request,
  required String endPoint,
  required Function(int statusCode, String errorDesc) failed,
  required Function(dynamic response) success,
  Options? options, // Optional options
}) async {
  try {
    late Response response;
    var jsonRequest = "";
    if (request != null) { // Check for null here
      if(request != ""){
        logD(message: "request");
        jsonRequest = jsonEncode(request.toJson());
      }
    }
    switch (networkRequestType ?? NetworkRequestType.post) {
      case NetworkRequestType.post:
        response = await NetworkService().myDio.post(
          endPoint,
          data: jsonRequest,
          options: options, // Use default options if null
        );
        break;
      case NetworkRequestType.get:
        response = await NetworkService().myDio.get(
          endPoint,
          data: jsonRequest,
          options: options, // Use default options if null
        );
        break;
      case NetworkRequestType.delete:
        response = await NetworkService().myDio.delete(
          endPoint,
          data: jsonRequest,
          options: options, // Use default options if null
        );
        break;
      case NetworkRequestType.patch:
        response = await NetworkService().myDio.patch(
          endPoint,
          data: jsonRequest,
          options: options, // Use default options if null
        );
        break;
      case NetworkRequestType.put:
        response = await NetworkService().myDio.put(
          endPoint,
          data: jsonRequest,
          options: options, // Use default options if null
        );
        break;
      default:
        response = await NetworkService().myDio.post(
          endPoint,
          data: jsonRequest,
          options: options,
        );
    }
    NetworkModel networkModel = NetworkModel.fromJson(response.data);
    if (networkModel.statusCode == 200) {
      success(networkModel.body);
    } else {
      failed(networkModel.statusCode!, networkModel.errorDesc!);
    }
  } catch (e) {
    logD(message: "${e.toString()}");
    failed(-1, e.toString());
  }
}
