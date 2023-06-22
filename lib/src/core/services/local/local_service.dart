import 'package:get_storage/get_storage.dart';

// Uygulamanın local veri tabanını kullandığımız kısım
class LocalService {
  LocalService._init();

  static late GetStorage _getStorage;
  static LocalService? _instance;

  static LocalService get instance {
    _instance ??= LocalService._init();
    _getStorage = GetStorage();
    return _instance!;
  }

  dynamic read(String key) {
    return _getStorage.read(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _getStorage.write(key, value);
  }

  Future<void> remove(String key) async {
    await _getStorage.remove(key);
  }
}
