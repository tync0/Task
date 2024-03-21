import 'package:task/src/feature/home/domain/entity/product_entity.dart';
import 'package:task/src/feature/home/domain/repository/main_repo.dart';
import '../../../../core/resource/datastate.dart';
import '../../../../core/usecase.dart';

class GetProductsUsecaseImpl
    implements GetProductsUsecase<DataState<List<ProductEntity>>> {
  final MainRepository _mainRepository;
  const GetProductsUsecaseImpl(this._mainRepository);
  @override
  Future<DataState<List<ProductEntity>>> call() {
    return _mainRepository.getProducts();
  }
}
