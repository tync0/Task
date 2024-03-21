import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  late FlutterSecureStorage _secureStorage;
  String? token;
  AuthInterceptor() {
    _init();
  }

  Future<void> _init() async {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    token = await _secureStorage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Basic $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}
