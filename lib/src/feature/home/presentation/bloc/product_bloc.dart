import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task/src/feature/home/domain/entity/product_entity.dart';
import '../../../../core/resource/datastate.dart';
import '../../domain/usecase/getproducts_usecase.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecaseImpl _getProductsUsecaseImpl;
  ProductBloc(this._getProductsUsecaseImpl) : super(ProductInitial()) {
    on<GetProductsEvent>(
      (event, emit) async {
        emit(ProductLoading());
        try {
          final dataState = await _getProductsUsecaseImpl.call();
          if (dataState is DataSuccess) {
            emit(
              ProductSuccess(dataState.data!),
            );
          } else {
            emit(
              ProductFailure(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            ProductFailure(e),
          );
        }
      },
    );
  }
}
