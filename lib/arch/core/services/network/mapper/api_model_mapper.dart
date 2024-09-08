const apiModelMapper = """
import '../../../base/model/pagination_model/base_pagination_model.dart';

class APIModelMapper {
  static List<T> jsonToList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return json.map((e) => fromJson(e)).toList().cast<T>();
  }

  static List<T> jsonToItemList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return json["items"].map((e) => fromJson(e)).toList().cast<T>();
  }

  static T jsonToItem<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return fromJson(json);
  }

  static BasePaginationModel<T> paginate<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return BasePaginationModel.fromJson(json, fromJson);
  }

  static BasePaginationModel<T> paginationModelToEntity<T>(
      BasePaginationModel response, List<T> data) {
    return BasePaginationModel<T>(
      data: data,
      page: response.page,
      lastPage: response.lastPage,
      perPage: response.perPage,
    );
  }
}
""";