import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/injection_container.dart';
import 'package:task/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/feature/home/presentation/bloc/product_bloc.dart';
import 'src/config/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final appRouter = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => s1<AuthBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => s1<ProductBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    ),
  );
}
