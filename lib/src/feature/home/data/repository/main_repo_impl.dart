import 'package:dio/dio.dart';
import 'package:task/src/core/resource/datastate.dart';
import 'package:task/src/feature/home/data/datasource/main_datasource.dart';
import 'package:task/src/feature/home/data/model/product_model.dart';
import 'package:task/src/feature/home/domain/entity/product_entity.dart';
import 'package:task/src/feature/home/domain/repository/main_repo.dart';

class MainRepositoryImpl implements MainRepository {
  final MainDataSource _dataSource;
  const MainRepositoryImpl(this._dataSource);
  @override
  Future<DataState<List<ProductEntity>>> getProducts() async {
    try {
      final httpResponse = await _dataSource.getProducts();
      if (httpResponse.response.statusCode == 200) {
        List<ProductModel> products = List<ProductModel>.from(
          httpResponse.response.data.map(
            (e) => ProductModel.fromJson(e),
          ),
        );
        return DataSuccess(products);
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
    }
  }
}
