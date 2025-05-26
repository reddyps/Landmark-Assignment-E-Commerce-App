import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_secret_model.freezed.dart';
part 'client_secret_model.g.dart';

@freezed
class ClientSecretModel with _$ClientSecretModel {
  const factory ClientSecretModel({
    @JsonKey(includeIfNull: false) String? clientSecret,
    @JsonKey(includeIfNull: false) int? statusCode,
    @JsonKey(includeIfNull: false) String? errorDesc,
  }) = _ClientSecretModel;

  factory ClientSecretModel.fromJson(Map<String, dynamic> json) =>
      _$ClientSecretModelFromJson(json);
}
