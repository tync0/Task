import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/storage/token_storage.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    String? token = await SecureStorage.readAccessToken();
    if (!mounted) {
      return;
    }
    if (token == null) {
      context.router.replaceNamed('/auth');
    } else {
      context.router.replaceNamed('/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
