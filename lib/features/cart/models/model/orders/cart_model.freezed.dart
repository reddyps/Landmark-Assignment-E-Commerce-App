// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  @JsonKey(includeIfNull: false)
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get statusMsg => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<UserCart>? get userCart => throw _privateConstructorUsedError;

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) int? statusCode,
    @JsonKey(includeIfNull: false) String? statusMsg,
    @JsonKey(includeIfNull: false) List<UserCart>? userCart,
  });
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMsg = freezed,
    Object? userCart = freezed,
  }) {
    return _then(
      _value.copyWith(
            statusCode:
                freezed == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int?,
            statusMsg:
                freezed == statusMsg
                    ? _value.statusMsg
                    : statusMsg // ignore: cast_nullable_to_non_nullable
                        as String?,
            userCart:
                freezed == userCart
                    ? _value.userCart
                    : userCart // ignore: cast_nullable_to_non_nullable
                        as List<UserCart>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
    _$CartModelImpl value,
    $Res Function(_$CartModelImpl) then,
  ) = __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) int? statusCode,
    @JsonKey(includeIfNull: false) String? statusMsg,
    @JsonKey(includeIfNull: false) List<UserCart>? userCart,
  });
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
    _$CartModelImpl _value,
    $Res Function(_$CartModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMsg = freezed,
    Object? userCart = freezed,
  }) {
    return _then(
      _$CartModelImpl(
        statusCode:
            freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int?,
        statusMsg:
            freezed == statusMsg
                ? _value.statusMsg
                : statusMsg // ignore: cast_nullable_to_non_nullable
                    as String?,
        userCart:
            freezed == userCart
                ? _value._userCart
                : userCart // ignore: cast_nullable_to_non_nullable
                    as List<UserCart>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl({
    @JsonKey(includeIfNull: false) this.statusCode,
    @JsonKey(includeIfNull: false) this.statusMsg,
    @JsonKey(includeIfNull: false) final List<UserCart>? userCart,
  }) : _userCart = userCart;

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? statusCode;
  @override
  @JsonKey(includeIfNull: false)
  final String? statusMsg;
  final List<UserCart>? _userCart;
  @override
  @JsonKey(includeIfNull: false)
  List<UserCart>? get userCart {
    final value = _userCart;
    if (value == null) return null;
    if (_userCart is EqualUnmodifiableListView) return _userCart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartModel(statusCode: $statusCode, statusMsg: $statusMsg, userCart: $userCart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMsg, statusMsg) ||
                other.statusMsg == statusMsg) &&
            const DeepCollectionEquality().equals(other._userCart, _userCart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    statusCode,
    statusMsg,
    const DeepCollectionEquality().hash(_userCart),
  );

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(this);
  }
}

abstract class _CartModel implements CartModel {
  const factory _CartModel({
    @JsonKey(includeIfNull: false) final int? statusCode,
    @JsonKey(includeIfNull: false) final String? statusMsg,
    @JsonKey(includeIfNull: false) final List<UserCart>? userCart,
  }) = _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get statusCode;
  @override
  @JsonKey(includeIfNull: false)
  String? get statusMsg;
  @override
  @JsonKey(includeIfNull: false)
  List<UserCart>? get userCart;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserCart _$UserCartFromJson(Map<String, dynamic> json) {
  return _UserCart.fromJson(json);
}

/// @nodoc
mixin _$UserCart {
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

  /// Serializes this UserCart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCartCopyWith<UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCartCopyWith<$Res> {
  factory $UserCartCopyWith(UserCart value, $Res Function(UserCart) then) =
      _$UserCartCopyWithImpl<$Res, UserCart>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(includeIfNull: false) int? userId,
    @JsonKey(includeIfNull: false) String? date,
    @JsonKey(includeIfNull: false) List<Products>? products,
    @JsonKey(includeIfNull: false) @JsonKey(name: '__v') int? iV,
  });
}

/// @nodoc
class _$UserCartCopyWithImpl<$Res, $Val extends UserCart>
    implements $UserCartCopyWith<$Res> {
  _$UserCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCart
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
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int?,
            date:
                freezed == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String?,
            products:
                freezed == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<Products>?,
            iV:
                freezed == iV
                    ? _value.iV
                    : iV // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserCartImplCopyWith<$Res>
    implements $UserCartCopyWith<$Res> {
  factory _$$UserCartImplCopyWith(
    _$UserCartImpl value,
    $Res Function(_$UserCartImpl) then,
  ) = __$$UserCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(includeIfNull: false) int? userId,
    @JsonKey(includeIfNull: false) String? date,
    @JsonKey(includeIfNull: false) List<Products>? products,
    @JsonKey(includeIfNull: false) @JsonKey(name: '__v') int? iV,
  });
}

/// @nodoc
class __$$UserCartImplCopyWithImpl<$Res>
    extends _$UserCartCopyWithImpl<$Res, _$UserCartImpl>
    implements _$$UserCartImplCopyWith<$Res> {
  __$$UserCartImplCopyWithImpl(
    _$UserCartImpl _value,
    $Res Function(_$UserCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCart
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
    return _then(
      _$UserCartImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int?,
        date:
            freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String?,
        products:
            freezed == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<Products>?,
        iV:
            freezed == iV
                ? _value.iV
                : iV // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCartImpl implements _UserCart {
  const _$UserCartImpl({
    @JsonKey(includeIfNull: false) this.id,
    @JsonKey(includeIfNull: false) this.userId,
    @JsonKey(includeIfNull: false) this.date,
    @JsonKey(includeIfNull: false) final List<Products>? products,
    @JsonKey(includeIfNull: false) @JsonKey(name: '__v') this.iV,
  }) : _products = products;

  factory _$UserCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCartImplFromJson(json);

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
    return 'UserCart(id: $id, userId: $userId, date: $date, products: $products, iV: $iV)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.iV, iV) || other.iV == iV));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    date,
    const DeepCollectionEquality().hash(_products),
    iV,
  );

  /// Create a copy of UserCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCartImplCopyWith<_$UserCartImpl> get copyWith =>
      __$$UserCartImplCopyWithImpl<_$UserCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCartImplToJson(this);
  }
}

abstract class _UserCart implements UserCart {
  const factory _UserCart({
    @JsonKey(includeIfNull: false) final int? id,
    @JsonKey(includeIfNull: false) final int? userId,
    @JsonKey(includeIfNull: false) final String? date,
    @JsonKey(includeIfNull: false) final List<Products>? products,
    @JsonKey(includeIfNull: false) @JsonKey(name: '__v') final int? iV,
  }) = _$UserCartImpl;

  factory _UserCart.fromJson(Map<String, dynamic> json) =
      _$UserCartImpl.fromJson;

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

  /// Create a copy of UserCart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCartImplCopyWith<_$UserCartImpl> get copyWith =>
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
  @JsonKey(includeIfNull: false)
  bool get isSelected => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double get price => throw _privateConstructorUsedError;

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
  $Res call({
    @JsonKey(includeIfNull: false) int? productId,
    @JsonKey(includeIfNull: false) int? quantity,
    @JsonKey(includeIfNull: false) bool isSelected,
    @JsonKey(includeIfNull: false) double price,
  });
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
    Object? isSelected = null,
    Object? price = null,
  }) {
    return _then(
      _value.copyWith(
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int?,
            quantity:
                freezed == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int?,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsImplCopyWith<$Res>
    implements $ProductsCopyWith<$Res> {
  factory _$$ProductsImplCopyWith(
    _$ProductsImpl value,
    $Res Function(_$ProductsImpl) then,
  ) = __$$ProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) int? productId,
    @JsonKey(includeIfNull: false) int? quantity,
    @JsonKey(includeIfNull: false) bool isSelected,
    @JsonKey(includeIfNull: false) double price,
  });
}

/// @nodoc
class __$$ProductsImplCopyWithImpl<$Res>
    extends _$ProductsCopyWithImpl<$Res, _$ProductsImpl>
    implements _$$ProductsImplCopyWith<$Res> {
  __$$ProductsImplCopyWithImpl(
    _$ProductsImpl _value,
    $Res Function(_$ProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? isSelected = null,
    Object? price = null,
  }) {
    return _then(
      _$ProductsImpl(
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int?,
        quantity:
            freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int?,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsImpl implements _Products {
  const _$ProductsImpl({
    @JsonKey(includeIfNull: false) this.productId,
    @JsonKey(includeIfNull: false) this.quantity,
    @JsonKey(includeIfNull: false) this.isSelected = false,
    @JsonKey(includeIfNull: false) this.price = 0,
  });

  factory _$ProductsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? productId;
  @override
  @JsonKey(includeIfNull: false)
  final int? quantity;
  @override
  @JsonKey(includeIfNull: false)
  final bool isSelected;
  @override
  @JsonKey(includeIfNull: false)
  final double price;

  @override
  String toString() {
    return 'Products(productId: $productId, quantity: $quantity, isSelected: $isSelected, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, quantity, isSelected, price);

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      __$$ProductsImplCopyWithImpl<_$ProductsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsImplToJson(this);
  }
}

abstract class _Products implements Products {
  const factory _Products({
    @JsonKey(includeIfNull: false) final int? productId,
    @JsonKey(includeIfNull: false) final int? quantity,
    @JsonKey(includeIfNull: false) final bool isSelected,
    @JsonKey(includeIfNull: false) final double price,
  }) = _$ProductsImpl;

  factory _Products.fromJson(Map<String, dynamic> json) =
      _$ProductsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get productId;
  @override
  @JsonKey(includeIfNull: false)
  int? get quantity;
  @override
  @JsonKey(includeIfNull: false)
  bool get isSelected;
  @override
  @JsonKey(includeIfNull: false)
  double get price;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
