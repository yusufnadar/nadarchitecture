import 'package:get_storage/get_storage.dart';

class LocalService {
  LocalService(this._getStorage);

  final GetStorage _getStorage;

  Future<void> init() async {
    await GetStorage.init();
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
