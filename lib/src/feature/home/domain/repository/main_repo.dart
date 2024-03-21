import 'package:task/src/feature/home/domain/entity/product_entity.dart';
import '../../../../core/resource/datastate.dart';

abstract class MainRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
