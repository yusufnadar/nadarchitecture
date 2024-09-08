const testEntity = """
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_entity.freezed.dart';
part 'test_entity.g.dart';

@freezed
class TestEntity with _\$TestEntity {
  @JsonSerializable(explicitToJson: true)
  const factory TestEntity({
    @JsonKey(name: 'name') String? name,
  }) = _TestEntity;

  factory TestEntity.fromJson(Map<String, Object?> json) =>
      _\$TestEntityFromJson(json);
}
""";