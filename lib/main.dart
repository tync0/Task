import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task/injection_container.dart';
import 'package:task/src/config/l10n/locale_provider.dart';
import 'package:task/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/feature/home/presentation/bloc/product_bloc.dart';
import 'src/config/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp.router(
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: provider.locale,
            title: 'Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        },
      ),
    ),
  );
}
