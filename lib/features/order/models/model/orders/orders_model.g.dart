// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersModelImpl _$$OrdersModelImplFromJson(Map<String, dynamic> json) =>
    _$OrdersModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMsg: json['statusMsg'] as String?,
      userOrders:
          (json['userOrders'] as List<dynamic>?)
              ?.map((e) => UserOrders.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$OrdersModelImplToJson(_$OrdersModelImpl instance) =>
    <String, dynamic>{
      if (instance.statusCode case final value?) 'statusCode': value,
      if (instance.statusMsg case final value?) 'statusMsg': value,
      if (instance.userOrders case final value?) 'userOrders': value,
    };

_$UserOrdersImpl _$$UserOrdersImplFromJson(Map<String, dynamic> json) =>
    _$UserOrdersImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      date: json['date'] as String?,
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
              .toList(),
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserOrdersImplToJson(_$UserOrdersImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.date case final value?) 'date': value,
      if (instance.products case final value?) 'products': value,
      if (instance.iV case final value?) 'iV': value,
    };

_$ProductsImpl _$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$ProductsImpl(
      productId: (json['productId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      if (instance.productId case final value?) 'productId': value,
      if (instance.quantity case final value?) 'quantity': value,
    };
