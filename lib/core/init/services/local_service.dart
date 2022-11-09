import 'package:get_storage/get_storage.dart';

class LocalService {
  final _storage = GetStorage();

  dynamic read(key) {
    return _storage.read(key);
  }

  Future<void> write(key, value) async {
    await _storage.write(key, value);
  }

  Future<void> remove(key) async {
    await _storage.remove(key);
  }
}
    