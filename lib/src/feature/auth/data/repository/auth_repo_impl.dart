import 'package:dio/dio.dart';
import 'package:task/src/core/resource/datastate.dart';
import 'package:task/src/core/storage/secure_storage.dart';
import 'package:task/src/feature/auth/data/datasource/auth_datasource.dart';
import 'package:task/src/feature/auth/domain/repository/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  const AuthRepositoryImpl(this._authDataSource);
  @override
  Future<DataState<void>> loginUser(String username, String password) async {
    try {
      final httpResponse = await _authDataSource.loginUser(
        {
          'username': username,
          'password': password,
        },
      );

      if (httpResponse.response.statusCode == 200) {
        final String token = httpResponse.response.data["token"];
        await SecureStorage.saveAccessToken(token);
        return DataSuccess(
          httpResponse.data,
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }
}
