import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/src/core/constants/service_const.dart';
import 'package:task/src/feature/home/data/model/product_model.dart';

part 'main_datasource.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class MainDataSource {
  factory MainDataSource(Dio dio) {
    dio.options = BaseOptions(contentType: 'application/json');
    return _MainDataSource(dio);
  }
  @GET(ServiceConst.productEndPoint)
  Future<HttpResponse> getProducts();
}
