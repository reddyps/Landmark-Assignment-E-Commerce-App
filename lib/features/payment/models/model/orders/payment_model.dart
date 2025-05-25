import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(includeIfNull: false) int? amount,
    @JsonKey(includeIfNull: false) String? currency,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
