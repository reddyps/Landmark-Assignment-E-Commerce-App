// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_secret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientSecretModelImpl _$$ClientSecretModelImplFromJson(
  Map<String, dynamic> json,
) => _$ClientSecretModelImpl(
  clientSecret: json['clientSecret'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  errorDesc: json['errorDesc'] as String?,
);

Map<String, dynamic> _$$ClientSecretModelImplToJson(
  _$ClientSecretModelImpl instance,
) => <String, dynamic>{
  if (instance.clientSecret case final value?) 'clientSecret': value,
  if (instance.statusCode case final value?) 'statusCode': value,
  if (instance.errorDesc case final value?) 'errorDesc': value,
};
