import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(includeIfNull: false)
    int? statusCode,
    @JsonKey(includeIfNull: false)
    String? statusMsg,
    @JsonKey(includeIfNull: false)
    List<UserCart>? userCart,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
}
@freezed
class UserCart with _$UserCart {
  const factory UserCart({
    @JsonKey(includeIfNull: false)
    int? id,
    @JsonKey(includeIfNull: false)
    int? userId,
    @JsonKey(includeIfNull: false)
    String? date,
    @JsonKey(includeIfNull: false)
    List<Products>? products,
    @JsonKey(includeIfNull: false)
    @JsonKey(name: '__v') int? iV,
  }) = _UserCart;

  factory UserCart.fromJson(Map<String, dynamic> json) => _$UserCartFromJson(json);
}

@freezed
class Products with _$Products {
  const factory Products({
    @JsonKey(includeIfNull: false)
    int? productId,
    @JsonKey(includeIfNull: false)
    int? quantity,
    @JsonKey(includeIfNull: false)
    @Default(false) bool isSelected,
    @JsonKey(includeIfNull: false)
    @Default(0) double price,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
}

