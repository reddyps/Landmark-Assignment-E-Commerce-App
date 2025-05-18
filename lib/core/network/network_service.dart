import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:landmark_assignment/core/network/network_interceptor.dart';
import 'package:landmark_assignment/core/util/value/api_endpoints.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';


class NetworkService {
  final className = "NetworkService";
  static final NetworkService _singleton =  NetworkService._internal();

  List<int>? certificateChainBytes;
  ByteData? clientCertificate;
  ByteData? privateKey;
  ByteData? rootCACertificate;

  factory NetworkService() {
    return _singleton;
  }

  NetworkService._internal();

  // global configuration
  Dio get myDio  {
    Dio dio =  Dio();
    try{
      dio.options.baseUrl = APIEndPoints.basedURL;
      dio.options.connectTimeout =  Duration(seconds: Constants.connectTimeout);
      dio.options.receiveTimeout =  Duration(seconds: Constants.receiveTimeout);
      _setHttpClientAdapter(dio, Constants.isSSLPinningEnabled);
      dio.interceptors.add(NetworkInterceptor());
    }
    catch(e){
      loge(tag : className, message: e.toString());
    }
    return dio;
  }

  void _setHttpClientAdapter(Dio dio, bool enableSSL) {
    if (kIsWeb) {
    } else if (Platform.isAndroid) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      if(enableSSL){
        dio.httpClientAdapter = IOHttpClientAdapter(
          createHttpClient: () {
            final SecurityContext scontext = SecurityContext();
            scontext.setTrustedCertificatesBytes(rootCACertificate!.buffer.asUint8List());
            scontext.usePrivateKeyBytes(privateKey!.buffer.asUint8List());
            scontext.useCertificateChainBytes(clientCertificate!.buffer.asUint8List());
            HttpClient client = HttpClient(context: scontext);
            return client;
          },
        );
      }
    } else if (Platform.isIOS) {

    }
  }

  loadCerts() async {
    clientCertificate = await rootBundle.load("assets/certificates/cert.pem");
    privateKey = await rootBundle.load("assets/certificates/Key.pem");
    rootCACertificate = await rootBundle.load("assets/certificates/ca.pem");
  }
}