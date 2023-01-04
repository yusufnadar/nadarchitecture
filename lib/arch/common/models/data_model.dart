const dataModel = """
// if api return some values before data, you can active this model

import 'package:json_annotation/json_annotation.dart';

import '../../core/base/base_model.dart';

@JsonSerializable()
class DataModel {
  DataModel({
    this.succeeded,
    this.errors,
    this.message,
    this.data,
  });

  bool? succeeded;
  String? message;
  dynamic data;
  List<String>? errors;

  DataModel fromJson<T extends BaseModel>(Map<String, dynamic> json, T? model) {
    return DataModel(
      succeeded: json["succeeded"],
      message: json["message"],
      data: json['data'] != null ? model!.fromJson(json["data"]) : null,
      errors: json["errors"] != null
          ? List<String>.from(json["errors"].map((x) => x))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "data": data!.toJsonRegister(),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };
}
    """;
