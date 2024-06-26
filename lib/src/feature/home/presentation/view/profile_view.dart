import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/extension/extension.dart';
import 'package:task/src/core/storage/secure_storage.dart';
import 'package:task/src/feature/auth/presentation/widget/auth_button.dart';
import 'package:task/src/feature/home/presentation/widget/language_dropdown.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../auth/presentation/widget/text_field.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final TextEditingController usernameController, passwordController;
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    SecureStorage.readUserInformation().then(
      (value) {
        var (username, password) = value;
        usernameController.text = username!;
        passwordController.text = password!;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Container(
                height: 170,
                width: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 60),
              AuthTextField(
                svg: Assets.emailIcon,
                hintText: 'Username',
                controller: usernameController,
              ),
              AuthTextField(
                svg: Assets.passwordIcon,
                hintText: 'Password',
                controller: passwordController,
              ),
              const LocaleDropDown(),
              const SizedBox(height: 50),
              AuthButton(
                title: l10n.save,
                onTap: () async {
                  await SecureStorage.saveUserInformation(
                    usernameController.text,
                    passwordController.text,
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: l10n.deleteAcc,
                color: Colors.red,
                onTap: () async {
                  await SecureStorage.deleteAccount();
                  context.router.replaceNamed('/splash');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
