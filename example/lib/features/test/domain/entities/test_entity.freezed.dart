// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestEntity _$TestEntityFromJson(Map<String, dynamic> json) {
  return _TestEntity.fromJson(json);
}

/// @nodoc
mixin _$TestEntity {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestEntityCopyWith<TestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestEntityCopyWith<$Res> {
  factory $TestEntityCopyWith(
          TestEntity value, $Res Function(TestEntity) then) =
      _$TestEntityCopyWithImpl<$Res, TestEntity>;
  @useResult
  $Res call({@JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$TestEntityCopyWithImpl<$Res, $Val extends TestEntity>
    implements $TestEntityCopyWith<$Res> {
  _$TestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestEntityImplCopyWith<$Res>
    implements $TestEntityCopyWith<$Res> {
  factory _$$TestEntityImplCopyWith(
          _$TestEntityImpl value, $Res Function(_$TestEntityImpl) then) =
      __$$TestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$TestEntityImplCopyWithImpl<$Res>
    extends _$TestEntityCopyWithImpl<$Res, _$TestEntityImpl>
    implements _$$TestEntityImplCopyWith<$Res> {
  __$$TestEntityImplCopyWithImpl(
      _$TestEntityImpl _value, $Res Function(_$TestEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$TestEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TestEntityImpl implements _TestEntity {
  const _$TestEntityImpl({@JsonKey(name: 'name') this.name});

  factory _$TestEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestEntityImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'TestEntity(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestEntityImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestEntityImplCopyWith<_$TestEntityImpl> get copyWith =>
      __$$TestEntityImplCopyWithImpl<_$TestEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestEntityImplToJson(
      this,
    );
  }
}

abstract class _TestEntity implements TestEntity {
  const factory _TestEntity({@JsonKey(name: 'name') final String? name}) =
      _$TestEntityImpl;

  factory _TestEntity.fromJson(Map<String, dynamic> json) =
      _$TestEntityImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$TestEntityImplCopyWith<_$TestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
