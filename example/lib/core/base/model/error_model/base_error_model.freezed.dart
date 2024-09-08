// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseErrorModel _$BaseErrorModelFromJson(Map<String, dynamic> json) {
  return _BaseErrorModel.fromJson(json);
}

/// @nodoc
mixin _$BaseErrorModel {
  @JsonKey(name: 'statusCode')
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseErrorModelCopyWith<BaseErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorModelCopyWith<$Res> {
  factory $BaseErrorModelCopyWith(
          BaseErrorModel value, $Res Function(BaseErrorModel) then) =
      _$BaseErrorModelCopyWithImpl<$Res, BaseErrorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') int? statusCode,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$BaseErrorModelCopyWithImpl<$Res, $Val extends BaseErrorModel>
    implements $BaseErrorModelCopyWith<$Res> {
  _$BaseErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseErrorModelImplCopyWith<$Res>
    implements $BaseErrorModelCopyWith<$Res> {
  factory _$$BaseErrorModelImplCopyWith(_$BaseErrorModelImpl value,
          $Res Function(_$BaseErrorModelImpl) then) =
      __$$BaseErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') int? statusCode,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$BaseErrorModelImplCopyWithImpl<$Res>
    extends _$BaseErrorModelCopyWithImpl<$Res, _$BaseErrorModelImpl>
    implements _$$BaseErrorModelImplCopyWith<$Res> {
  __$$BaseErrorModelImplCopyWithImpl(
      _$BaseErrorModelImpl _value, $Res Function(_$BaseErrorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BaseErrorModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseErrorModelImpl implements _BaseErrorModel {
  const _$BaseErrorModelImpl(
      {@JsonKey(name: 'statusCode') this.statusCode,
      @JsonKey(name: 'message') this.message});

  factory _$BaseErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseErrorModelImplFromJson(json);

  @override
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'BaseErrorModel(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseErrorModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseErrorModelImplCopyWith<_$BaseErrorModelImpl> get copyWith =>
      __$$BaseErrorModelImplCopyWithImpl<_$BaseErrorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseErrorModelImplToJson(
      this,
    );
  }
}

abstract class _BaseErrorModel implements BaseErrorModel {
  const factory _BaseErrorModel(
      {@JsonKey(name: 'statusCode') final int? statusCode,
      @JsonKey(name: 'message') final String? message}) = _$BaseErrorModelImpl;

  factory _BaseErrorModel.fromJson(Map<String, dynamic> json) =
      _$BaseErrorModelImpl.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  int? get statusCode;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BaseErrorModelImplCopyWith<_$BaseErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
