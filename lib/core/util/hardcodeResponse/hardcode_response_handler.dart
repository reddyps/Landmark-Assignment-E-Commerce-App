import 'dart:convert';

import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_apis.dart';
import 'package:landmark_assignment/core/util/hardcodeResponse/hardcode_response_data.dart';

Future<T> hardcodeResponse<T>({
  required HardcodeApis hardcodeApi,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  await delay();
  try {
    switch(HardcodeApis){
      case HardcodeApis.login:
        return fromJson(jsonDecode(HardcodeResponseData.loginResponse));
      default:
        return fromJson(jsonDecode(HardcodeResponseData.loginResponse));
    }
  } catch (e) {
    return fromJson(jsonDecode(HardcodeResponseData.defaultResponse));
  }
}

delay() async {
  await Future.delayed(const Duration(seconds: 2), () {});
}