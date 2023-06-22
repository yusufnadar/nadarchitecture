// Tüm modellerde bulunması gereken fonksiyonları içerir
abstract class BaseModel<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
