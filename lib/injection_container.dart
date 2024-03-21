import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/src/feature/auth/data/datasource/auth_datasource.dart';
import 'package:task/src/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:task/src/feature/auth/domain/repository/auth_repo.dart';
import 'package:task/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/feature/home/data/datasource/main_datasource.dart';
import 'package:task/src/feature/home/data/repository/main_repo_impl.dart';
import 'package:task/src/feature/home/domain/repository/main_repo.dart';
import 'package:task/src/feature/home/domain/usecase/getproducts_usecase.dart';
import 'package:task/src/feature/home/presentation/bloc/product_bloc.dart';
import 'src/core/interceptor/auth_interceptor.dart';
import 'src/feature/auth/domain/usecase/auth_usecase.dart';

GetIt s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  s1.registerLazySingleton<Dio>(() => Dio());

  //interceptor
  s1.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor());

  //datasources
  s1.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(s1()),
  );
  s1.registerLazySingleton<MainDataSource>(
    () => MainDataSource(s1()),
  );

  //repository
  s1.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(s1()),
  );
  s1.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(s1()),
  );

  //usecase
  s1.registerLazySingleton<GetProductsUsecaseImpl>(
    () => GetProductsUsecaseImpl(s1<MainRepository>()),
  );

  s1.registerLazySingleton<AuthUsecaseImpl>(
    () => AuthUsecaseImpl(s1<AuthRepository>()),
  );

  //blocs
  s1.registerFactory<AuthBloc>(
    () => AuthBloc(s1<AuthUsecaseImpl>()),
  );
  s1.registerFactory<ProductBloc>(
    () => ProductBloc(s1<GetProductsUsecaseImpl>()),
  );
}
