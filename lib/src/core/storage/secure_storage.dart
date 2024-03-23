import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<String?> readAccessToken() async {
    return _storage.read(key: 'token');
  }

  static Future<void> deleteAccount() async {
    return _storage.delete(key: 'token');
  }

  static Future<void> saveUserInformation(
      String username, String password) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'password', value: password);
  }

  static Future<(String?, String?)> readUserInformation() async {
    final String? username = await _storage.read(key: 'username');
    final String? password = await _storage.read(key: 'password');
    return (username, password);
  }
}
