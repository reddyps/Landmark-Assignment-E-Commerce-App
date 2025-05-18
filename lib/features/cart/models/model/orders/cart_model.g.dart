// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMsg: json['statusMsg'] as String?,
      userCart: (json['userCart'] as List<dynamic>?)
          ?.map((e) => UserCart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      if (instance.statusCode case final value?) 'statusCode': value,
      if (instance.statusMsg case final value?) 'statusMsg': value,
      if (instance.userCart case final value?) 'userCart': value,
    };

_$UserCartImpl _$$UserCartImplFromJson(Map<String, dynamic> json) =>
    _$UserCartImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      date: json['date'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserCartImplToJson(_$UserCartImpl instance) =>
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
      isSelected: json['isSelected'] as bool? ?? false,
      price: (json['price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      if (instance.productId case final value?) 'productId': value,
      if (instance.quantity case final value?) 'quantity': value,
      'isSelected': instance.isSelected,
      'price': instance.price,
    };
