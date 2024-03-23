import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/service_const.dart';

part 'auth_datasource.g.dart';

@RestApi(baseUrl: ServiceConst.baseUrl)
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio) {
    dio.options = BaseOptions(contentType: 'application/json');
    return _AuthDataSource(dio);
  }
  @POST(ServiceConst.loginEndPoint)
  Future<HttpResponse<void>> loginUser(@Body() Map<String, dynamic> body);
}
