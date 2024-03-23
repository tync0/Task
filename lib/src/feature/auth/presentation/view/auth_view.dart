import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/constants/assets_const.dart';
import 'package:task/src/core/extension/extension.dart';
import 'package:task/src/core/storage/secure_storage.dart';
import 'package:task/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/feature/auth/presentation/widget/auth_button.dart';
import 'package:task/src/feature/auth/presentation/widget/text_field.dart';

@RoutePage()
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final TextEditingController emailController, passwordController;
  late final AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.close();
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: context.mediaQueryWidth,
          height: context.mediaQueryHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 40),
                child: Text(
                  'Login',
                  style: context.textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      AuthTextField(
                        svg: Assets.emailIcon,
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      AuthTextField(
                        svg: Assets.passwordIcon,
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const Spacer(),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) async {
                          if (state is AuthSuccess) {
                            await SecureStorage.saveUserInformation(
                              emailController.text,
                              passwordController.text,
                            );
                            if (!mounted) {
                              return;
                            }
                            context.router.replaceNamed('/main');
                          } else if (state is AuthLoading) {
                            showDialog<Dialog>(
                              context: context,
                              builder: (context) => const Center(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          } else {
                            context.router.maybePop();
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthFailed) {
                            return Text(state.toString());
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      AuthButton(
                        onTap: () {
                          _authBloc.add(
                            AuthInput(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
