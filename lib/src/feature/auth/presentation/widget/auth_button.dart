import 'package:flutter/material.dart';
import 'package:task/src/core/extension/extension.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Color? color;
  const AuthButton({
    super.key,
    this.onTap,
    this.title = "Login",
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQueryWidth,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          title == "Login" ? 36 : 12,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title!,
            style: context.textTheme.displaySmall!.copyWith(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
