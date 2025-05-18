import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';
@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(includeIfNull: false)
    int? id,
    @JsonKey(includeIfNull: false)
    int? userId,
    @JsonKey(includeIfNull: false)
    int? statusCode,
    @JsonKey(includeIfNull: false)
    String? statusMsg,
    @JsonKey(includeIfNull: false)
    List<CartItem>? cartList,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    // No rating
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
