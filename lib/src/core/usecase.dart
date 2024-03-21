abstract class GetProductsUsecase<T> {
  Future<T> call();
}

abstract class AuthUsecase<T> {
  Future<T> call(String username, String password);
}
