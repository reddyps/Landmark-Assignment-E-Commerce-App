// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  @JsonKey(includeIfNull: false)
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get statusMsg => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<UserOrders>? get userOrders => throw _privateConstructorUsedError;

  /// Serializes this OrdersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
          OrdersModel value, $Res Function(OrdersModel) then) =
      _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? statusCode,
      @JsonKey(includeIfNull: false) String? statusMsg,
      @JsonKey(includeIfNull: false) List<UserOrders>? userOrders});
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMsg = freezed,
    Object? userOrders = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMsg: freezed == statusMsg
          ? _value.statusMsg
          : statusMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      userOrders: freezed == userOrders
          ? _value.userOrders
          : userOrders // ignore: cast_nullable_to_non_nullable
              as List<UserOrders>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersModelImplCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$OrdersModelImplCopyWith(
          _$OrdersModelImpl value, $Res Function(_$OrdersModelImpl) then) =
      __$$OrdersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? statusCode,
      @JsonKey(includeIfNull: false) String? statusMsg,
      @JsonKey(includeIfNull: false) List<UserOrders>? userOrders});
}

/// @nodoc
class __$$OrdersModelImplCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$OrdersModelImpl>
    implements _$$OrdersModelImplCopyWith<$Res> {
  __$$OrdersModelImplCopyWithImpl(
      _$OrdersModelImpl _value, $Res Function(_$OrdersModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMsg = freezed,
    Object? userOrders = freezed,
  }) {
    return _then(_$OrdersModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMsg: freezed == statusMsg
          ? _value.statusMsg
          : statusMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      userOrders: freezed == userOrders
          ? _value._userOrders
          : userOrders // ignore: cast_nullable_to_non_nullable
              as List<UserOrders>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersModelImpl implements _OrdersModel {
  const _$OrdersModelImpl(
      {@JsonKey(includeIfNull: false) this.statusCode,
      @JsonKey(includeIfNull: false) this.statusMsg,
      @JsonKey(includeIfNull: false) final List<UserOrders>? userOrders})
      : _userOrders = userOrders;

  factory _$OrdersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? statusCode;
  @override
  @JsonKey(includeIfNull: false)
  final String? statusMsg;
  final List<UserOrders>? _userOrders;
  @override
  @JsonKey(includeIfNull: false)
  List<UserOrders>? get userOrders {
    final value = _userOrders;
    if (value == null) return null;
    if (_userOrders is EqualUnmodifiableListView) return _userOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrdersModel(statusCode: $statusCode, statusMsg: $statusMsg, userOrders: $userOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMsg, statusMsg) ||
                other.statusMsg == statusMsg) &&
            const DeepCollectionEquality()
                .equals(other._userOrders, _userOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMsg,
      const DeepCollectionEquality().hash(_userOrders));

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      __$$OrdersModelImplCopyWithImpl<_$OrdersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersModelImplToJson(
      this,
    );
  }
}

abstract class _OrdersModel implements OrdersModel {
  const factory _OrdersModel(
          {@JsonKey(includeIfNull: false) final int? statusCode,
          @JsonKey(includeIfNull: false) final String? statusMsg,
          @JsonKey(includeIfNull: false) final List<UserOrders>? userOrders}) =
      _$OrdersModelImpl;

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$OrdersModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get statusCode;
  @override
  @JsonKey(includeIfNull: false)
  String? get statusMsg;
  @override
  @JsonKey(includeIfNull: false)
  List<UserOrders>? get userOrders;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserOrders _$UserOrdersFromJson(Map<String, dynamic> json) {
  return _UserOrders.fromJson(json);
}

/// @nodoc
mixin _$UserOrders {
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<Products>? get products => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  @JsonKey(name: '__v')
  int? get iV => throw _privateConstructorUsedError;

  /// Serializes this UserOrders to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserOrders
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOrdersCopyWith<UserOrders> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrdersCopyWith<$Res> {
  factory $UserOrdersCopyWith(
          UserOrders value, $Res Function(UserOrders) then) =
      _$UserOrdersCopyWithImpl<$Res, UserOrders>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeIfNull: false) int? userId,
      @JsonKey(includeIfNull: false) String? date,
      @JsonKey(includeIfNull: false) List<Products>? products,
      @JsonKey(includeIfNull: false) @JsonKey(name: '__v') int? iV});
}

/// @nodoc
class _$UserOrdersCopyWithImpl<$Res, $Val extends UserOrders>
    implements $UserOrdersCopyWith<$Res> {
  _$UserOrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOrders
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? date = freezed,
    Object? products = freezed,
    Object? iV = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Products>?,
      iV: freezed == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOrdersImplCopyWith<$Res>
    implements $UserOrdersCopyWith<$Res> {
  factory _$$UserOrdersImplCopyWith(
          _$UserOrdersImpl value, $Res Function(_$UserOrdersImpl) then) =
      __$$UserOrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeIfNull: false) int? userId,
      @JsonKey(includeIfNull: false) String? date,
      @JsonKey(includeIfNull: false) List<Products>? products,
      @JsonKey(includeIfNull: false) @JsonKey(name: '__v') int? iV});
}

/// @nodoc
class __$$UserOrdersImplCopyWithImpl<$Res>
    extends _$UserOrdersCopyWithImpl<$Res, _$UserOrdersImpl>
    implements _$$UserOrdersImplCopyWith<$Res> {
  __$$UserOrdersImplCopyWithImpl(
      _$UserOrdersImpl _value, $Res Function(_$UserOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOrders
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? date = freezed,
    Object? products = freezed,
    Object? iV = freezed,
  }) {
    return _then(_$UserOrdersImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Products>?,
      iV: freezed == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOrdersImpl implements _UserOrders {
  const _$UserOrdersImpl(
      {@JsonKey(includeIfNull: false) this.id,
      @JsonKey(includeIfNull: false) this.userId,
      @JsonKey(includeIfNull: false) this.date,
      @JsonKey(includeIfNull: false) final List<Products>? products,
      @JsonKey(includeIfNull: false) @JsonKey(name: '__v') this.iV})
      : _products = products;

  factory _$UserOrdersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOrdersImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  @JsonKey(includeIfNull: false)
  final int? userId;
  @override
  @JsonKey(includeIfNull: false)
  final String? date;
  final List<Products>? _products;
  @override
  @JsonKey(includeIfNull: false)
  List<Products>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  @JsonKey(name: '__v')
  final int? iV;

  @override
  String toString() {
    return 'UserOrders(id: $id, userId: $userId, date: $date, products: $products, iV: $iV)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOrdersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.iV, iV) || other.iV == iV));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date,
      const DeepCollectionEquality().hash(_products), iV);

  /// Create a copy of UserOrders
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOrdersImplCopyWith<_$UserOrdersImpl> get copyWith =>
      __$$UserOrdersImplCopyWithImpl<_$UserOrdersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOrdersImplToJson(
      this,
    );
  }
}

abstract class _UserOrders implements UserOrders {
  const factory _UserOrders(
          {@JsonKey(includeIfNull: false) final int? id,
          @JsonKey(includeIfNull: false) final int? userId,
          @JsonKey(includeIfNull: false) final String? date,
          @JsonKey(includeIfNull: false) final List<Products>? products,
          @JsonKey(includeIfNull: false) @JsonKey(name: '__v') final int? iV}) =
      _$UserOrdersImpl;

  factory _UserOrders.fromJson(Map<String, dynamic> json) =
      _$UserOrdersImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get id;
  @override
  @JsonKey(includeIfNull: false)
  int? get userId;
  @override
  @JsonKey(includeIfNull: false)
  String? get date;
  @override
  @JsonKey(includeIfNull: false)
  List<Products>? get products;
  @override
  @JsonKey(includeIfNull: false)
  @JsonKey(name: '__v')
  int? get iV;

  /// Create a copy of UserOrders
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOrdersImplCopyWith<_$UserOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return _Products.fromJson(json);
}

/// @nodoc
mixin _$Products {
  @JsonKey(includeIfNull: false)
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this Products to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsCopyWith<Products> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCopyWith<$Res> {
  factory $ProductsCopyWith(Products value, $Res Function(Products) then) =
      _$ProductsCopyWithImpl<$Res, Products>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? productId,
      @JsonKey(includeIfNull: false) int? quantity});
}

/// @nodoc
class _$ProductsCopyWithImpl<$Res, $Val extends Products>
    implements $ProductsCopyWith<$Res> {
  _$ProductsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsImplCopyWith<$Res>
    implements $ProductsCopyWith<$Res> {
  factory _$$ProductsImplCopyWith(
          _$ProductsImpl value, $Res Function(_$ProductsImpl) then) =
      __$$ProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? productId,
      @JsonKey(includeIfNull: false) int? quantity});
}

/// @nodoc
class __$$ProductsImplCopyWithImpl<$Res>
    extends _$ProductsCopyWithImpl<$Res, _$ProductsImpl>
    implements _$$ProductsImplCopyWith<$Res> {
  __$$ProductsImplCopyWithImpl(
      _$ProductsImpl _value, $Res Function(_$ProductsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$ProductsImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsImpl implements _Products {
  const _$ProductsImpl(
      {@JsonKey(includeIfNull: false) this.productId,
      @JsonKey(includeIfNull: false) this.quantity});

  factory _$ProductsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? productId;
  @override
  @JsonKey(includeIfNull: false)
  final int? quantity;

  @override
  String toString() {
    return 'Products(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      __$$ProductsImplCopyWithImpl<_$ProductsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsImplToJson(
      this,
    );
  }
}

abstract class _Products implements Products {
  const factory _Products(
      {@JsonKey(includeIfNull: false) final int? productId,
      @JsonKey(includeIfNull: false) final int? quantity}) = _$ProductsImpl;

  factory _Products.fromJson(Map<String, dynamic> json) =
      _$ProductsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get productId;
  @override
  @JsonKey(includeIfNull: false)
  int? get quantity;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
