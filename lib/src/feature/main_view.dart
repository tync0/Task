import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/src/config/router/app_router.dart';
import 'package:task/src/core/constants/assets_const.dart';
import 'home/presentation/widget/bottom_item.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: Container(
            color: Colors.transparent,
            height: 70,
            margin: const EdgeInsets.only(
              left: 80,
              right: 80,
              bottom: 40,
            ),
            child: Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color(0xFFB8B8B8).withOpacity(0.5),
                      ),
                      child: Row(
                        children: [
                          BottomNavBarItem(
                            svgName: Assets.homeIcon,
                            onTap: () => tabsRouter.setActiveIndex(0),
                            check: 0 == tabsRouter.activeIndex,
                          ),
                          const SizedBox(width: 14),
                          BottomNavBarItem(
                            svgName: Assets.profileIcon,
                            onTap: () => tabsRouter.setActiveIndex(1),
                            check: 1 == tabsRouter.activeIndex,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
