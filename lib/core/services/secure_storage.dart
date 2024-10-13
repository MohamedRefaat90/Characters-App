import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> delete(String key) async {
    _storage.delete(key: key);
  }

  static Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  static Future<void> write(String key, String value) async {
    _storage.write(key: key, value: value);
  }
}
