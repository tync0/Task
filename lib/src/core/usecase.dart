abstract class GetProductsUsecase<T> {
  Future<T> call({int? limit});
}

abstract class AuthUsecase<T> {
  Future<T> call(String username, String password);
}
