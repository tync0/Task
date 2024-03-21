part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? error;
  const ProductState({
    this.products,
    this.error,
  });
}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductFailure extends ProductState {
  const ProductFailure(DioException error) : super(error: error);
  @override
  List<Object?> get props => [error];
}

class ProductSuccess extends ProductState {
  const ProductSuccess(List<ProductEntity> products)
      : super(products: products);
  @override
  List<Object?> get props => [products];
}
