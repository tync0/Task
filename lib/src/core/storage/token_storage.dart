import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<String?> readAccessToken() async {
    return _storage.read(key: 'token');
  }
}
