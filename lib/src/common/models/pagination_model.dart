import '../../core/base/model/base_model.dart';

class PaginationModel<T extends BaseModel?> {
  PaginationModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<T>? results;

  PaginationModel fromJson(Map<String, dynamic> json, T? model) {
    return PaginationModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] != null
          ? List<T>.from(
              json["results"].map((x) => model!.fromJson(x)),
            )
          : <T>[],
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(
          results!.map((x) => x!.toJson()),
        ),
      };
}
    