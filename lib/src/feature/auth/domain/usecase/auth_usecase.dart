import 'package:task/src/core/resource/datastate.dart';
import 'package:task/src/core/usecase.dart';
import 'package:task/src/feature/auth/domain/repository/auth_repo.dart';

class AuthUsecaseImpl implements AuthUsecase<DataState<void>> {
  final AuthRepository _authRepository;
  const AuthUsecaseImpl(this._authRepository);
  @override
  Future<DataState<void>> call(String username, String password) {
    return _authRepository.loginUser(username, password);
  }
}
