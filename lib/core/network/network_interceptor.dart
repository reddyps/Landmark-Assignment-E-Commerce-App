import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:landmark_assignment/core/models/networkmodel/network_model.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';

class NetworkInterceptor extends Interceptor {
  final className ="NetworkInterceptor";
  NetworkModel networkModel = NetworkModel();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logD(tag : className, message: "Path : ${options.baseUrl}${options.path}");
    logD(tag : className, message: "Headers : ${options.headers.toString()}");
    logD(tag : className, message: "Pre requested data : ${options.data.toString()}");
    try{
      Connectivity connectivity = Connectivity();
      if (!await connectivity.checkNetworkConnectivity()) {
        return handler.reject(DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: Constants.noNetworkErrMsg,
        ));
      }
      return handler.next(options);
    }
    catch(e){
      loge(tag : className, message: "onRequest ${e.toString()}");
      return handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.cancel,
        error: e.toString(),
      ));
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logD(tag : className, message: "Response : ${response.toString()}");
    try{
      networkModel.statusCode = response.statusCode;
      networkModel.body = response.data;
      response.data = networkModel.toJson();
    }
    catch(e){
      loge(tag : className, message: "onResponse ${e.toString()}");
      networkModel.statusCode = -1;
      networkModel.errorDesc = e.toString();
      response.data = networkModel.toJson();
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logD(tag : className, message:"DIO ERR response: ${err.response.toString()}");
    logD(tag : className, message:"DIO ERR error: ${err.error.toString()}");
    logD(tag : className, message:"DIO ERR message: ${err.message.toString()}");
    try{
      networkModel.statusCode = -1;
      if(err.response!=null){
        if(err.response!.statusCode== 404){
          networkModel.statusCode = err.response!.statusCode;
          networkModel.errorDesc = Constants.serviceNotFound;
        }
        else if(err.response!.statusCode== 401){
          networkModel.statusCode = err.response!.statusCode;
          networkModel.errorDesc = Constants.unAuth;
        }
        else{
          networkModel.statusCode = err.response!.statusCode;
          networkModel.errorDesc = err.response!.statusMessage ??  Constants.someWentWrong;
        }
      }
      if(err.type == DioExceptionType.connectionTimeout){
        networkModel.errorDesc = Constants.connectionTimeOut;
      }
      else if(err.type == DioExceptionType.connectionError){
        networkModel.errorDesc = Constants.noNetworkErrMsg;
      }
      else if(err.type == DioExceptionType.receiveTimeout){
        networkModel.errorDesc = Constants.receiveTimeOut;
      }
      else if(err.type == DioExceptionType.sendTimeout){
        networkModel.errorDesc = Constants.sendTimeout;
      }
      else{
        networkModel.errorDesc = Constants.someWentWrong;
      }
    }
    catch(e){
      loge(tag : className, message: "onError ${e.toString()}");
      networkModel.statusCode = -1;
      networkModel.errorDesc = e.toString();
    }
    finally{
      err.response!.data= networkModel.toJson();
    }
    return  handler.resolve(err.response!);
  }

}