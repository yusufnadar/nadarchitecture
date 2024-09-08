const basePaginationModel = """
class BasePaginationModel<T> {
  final String? total;
  final int? perPage;
  final int? page;
  final int? lastPage;
  final List<T>? data;

  BasePaginationModel({this.total, this.page, this.lastPage, this.perPage, this.data});

  factory BasePaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return BasePaginationModel(
      total: json['total'],
      perPage: json['perPage'],
      page: json['page'],
      lastPage: json['lastPage'],
      data: json["data"]?.map((e) => fromJson(e)).toList().cast<T>(),
    );
  }
}
""";