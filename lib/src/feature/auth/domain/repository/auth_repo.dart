import 'package:task/src/core/resource/datastate.dart';

abstract class AuthRepository {
  Future<DataState<void>> loginUser(
    String username,
    String password,
  );
}
