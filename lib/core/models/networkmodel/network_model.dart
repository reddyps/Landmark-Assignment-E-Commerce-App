import 'package:landmark_assignment/core/util/extension/method_extension.dart';

class NetworkModel{
  dynamic? body;
  int? statusCode;
  String? errorDesc;
  NetworkModel({this.body,this.statusCode,this.errorDesc});

  NetworkModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    statusCode=json['statusCode'];
    errorDesc = json['errorDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(body!=null){
      data['body'] = body;
    }
    if(statusCode!= null){
      data['statusCode'] = statusCode;
    }
    if(errorDesc!=null && !errorDesc!.isNullOrEmpty()){
      data['errorDesc'] = errorDesc;
    }
    return data;
  }

}
