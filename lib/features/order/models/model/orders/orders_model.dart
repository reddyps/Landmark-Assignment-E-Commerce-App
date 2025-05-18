import 'package:landmark_assignment/features/product/models/model/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrdersModel with _$OrdersModel {
  const factory OrdersModel({
    @JsonKey(includeIfNull: false)
    int? statusCode,
    @JsonKey(includeIfNull: false)
    String? statusMsg,
    @JsonKey(includeIfNull: false)
    List<UserOrders>? userOrders,
  }) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => _$OrdersModelFromJson(json);
}
@freezed
class UserOrders with _$UserOrders {
  const factory UserOrders({
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
  }) = _UserOrders;

  factory UserOrders.fromJson(Map<String, dynamic> json) => _$UserOrdersFromJson(json);
}

@freezed
class Products with _$Products {
  const factory Products({
    @JsonKey(includeIfNull: false)
    int? productId,
    @JsonKey(includeIfNull: false)
    int? quantity,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
}

