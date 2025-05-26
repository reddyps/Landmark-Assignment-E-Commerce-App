// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_secret_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClientSecretModel _$ClientSecretModelFromJson(Map<String, dynamic> json) {
  return _ClientSecretModel.fromJson(json);
}

/// @nodoc
mixin _$ClientSecretModel {
  @JsonKey(includeIfNull: false)
  String? get clientSecret => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get errorDesc => throw _privateConstructorUsedError;

  /// Serializes this ClientSecretModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientSecretModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientSecretModelCopyWith<ClientSecretModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientSecretModelCopyWith<$Res> {
  factory $ClientSecretModelCopyWith(
    ClientSecretModel value,
    $Res Function(ClientSecretModel) then,
  ) = _$ClientSecretModelCopyWithImpl<$Res, ClientSecretModel>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? clientSecret,
    @JsonKey(includeIfNull: false) int? statusCode,
    @JsonKey(includeIfNull: false) String? errorDesc,
  });
}

/// @nodoc
class _$ClientSecretModelCopyWithImpl<$Res, $Val extends ClientSecretModel>
    implements $ClientSecretModelCopyWith<$Res> {
  _$ClientSecretModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientSecretModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = freezed,
    Object? statusCode = freezed,
    Object? errorDesc = freezed,
  }) {
    return _then(
      _value.copyWith(
            clientSecret:
                freezed == clientSecret
                    ? _value.clientSecret
                    : clientSecret // ignore: cast_nullable_to_non_nullable
                        as String?,
            statusCode:
                freezed == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int?,
            errorDesc:
                freezed == errorDesc
                    ? _value.errorDesc
                    : errorDesc // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClientSecretModelImplCopyWith<$Res>
    implements $ClientSecretModelCopyWith<$Res> {
  factory _$$ClientSecretModelImplCopyWith(
    _$ClientSecretModelImpl value,
    $Res Function(_$ClientSecretModelImpl) then,
  ) = __$$ClientSecretModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? clientSecret,
    @JsonKey(includeIfNull: false) int? statusCode,
    @JsonKey(includeIfNull: false) String? errorDesc,
  });
}

/// @nodoc
class __$$ClientSecretModelImplCopyWithImpl<$Res>
    extends _$ClientSecretModelCopyWithImpl<$Res, _$ClientSecretModelImpl>
    implements _$$ClientSecretModelImplCopyWith<$Res> {
  __$$ClientSecretModelImplCopyWithImpl(
    _$ClientSecretModelImpl _value,
    $Res Function(_$ClientSecretModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClientSecretModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = freezed,
    Object? statusCode = freezed,
    Object? errorDesc = freezed,
  }) {
    return _then(
      _$ClientSecretModelImpl(
        clientSecret:
            freezed == clientSecret
                ? _value.clientSecret
                : clientSecret // ignore: cast_nullable_to_non_nullable
                    as String?,
        statusCode:
            freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int?,
        errorDesc:
            freezed == errorDesc
                ? _value.errorDesc
                : errorDesc // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientSecretModelImpl implements _ClientSecretModel {
  const _$ClientSecretModelImpl({
    @JsonKey(includeIfNull: false) this.clientSecret,
    @JsonKey(includeIfNull: false) this.statusCode,
    @JsonKey(includeIfNull: false) this.errorDesc,
  });

  factory _$ClientSecretModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientSecretModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? clientSecret;
  @override
  @JsonKey(includeIfNull: false)
  final int? statusCode;
  @override
  @JsonKey(includeIfNull: false)
  final String? errorDesc;

  @override
  String toString() {
    return 'ClientSecretModel(clientSecret: $clientSecret, statusCode: $statusCode, errorDesc: $errorDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientSecretModelImpl &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorDesc, errorDesc) ||
                other.errorDesc == errorDesc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientSecret, statusCode, errorDesc);

  /// Create a copy of ClientSecretModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientSecretModelImplCopyWith<_$ClientSecretModelImpl> get copyWith =>
      __$$ClientSecretModelImplCopyWithImpl<_$ClientSecretModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientSecretModelImplToJson(this);
  }
}

abstract class _ClientSecretModel implements ClientSecretModel {
  const factory _ClientSecretModel({
    @JsonKey(includeIfNull: false) final String? clientSecret,
    @JsonKey(includeIfNull: false) final int? statusCode,
    @JsonKey(includeIfNull: false) final String? errorDesc,
  }) = _$ClientSecretModelImpl;

  factory _ClientSecretModel.fromJson(Map<String, dynamic> json) =
      _$ClientSecretModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get clientSecret;
  @override
  @JsonKey(includeIfNull: false)
  int? get statusCode;
  @override
  @JsonKey(includeIfNull: false)
  String? get errorDesc;

  /// Create a copy of ClientSecretModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientSecretModelImplCopyWith<_$ClientSecretModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
