import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends BaseModel<PostModel> {
  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  @override
  fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
