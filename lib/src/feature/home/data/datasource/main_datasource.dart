import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/src/core/constants/service_const.dart';
import 'package:task/src/core/interceptor/auth_interceptor.dart';
part 'main_datasource.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class MainDataSource {
  factory MainDataSource(Dio dio) {
    dio.options = BaseOptions(contentType: 'application/json');
    dio.interceptors.add(AuthInterceptor());
    return _MainDataSource(dio);
  }
  @GET('${ServiceConst.productEndPoint}?limit={limit}&offset=5')
  Future<HttpResponse> getProducts(
    @Path('limit') int? limit,
  );
}
