import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/presentation/view/auth_view.dart';
import '../../feature/home/domain/entity/product_entity.dart';
import '../../feature/home/presentation/view/detail_view.dart';
import '../../feature/home/presentation/view/home_view.dart';
import '../../feature/home/main_view.dart';
import '../../feature/home/presentation/view/profile_view.dart';
import '../../feature/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),
        AutoRoute(
          page: DetailRoute.page,
          path: '/detail',
        ),
      ];
}
