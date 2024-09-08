const testModel = """
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';

@freezed
class TestModel with _\$TestModel {
  @JsonSerializable(explicitToJson: true)
  const factory TestModel({
    @JsonKey(name: 'name') String? name,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, Object?> json) =>
      _\$TestModelFromJson(json);
}
""";