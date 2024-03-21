import 'package:flutter/material.dart';
import 'package:task/src/core/extension/extension.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  const AuthButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.mediaQueryWidth,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Center(
          child: Text(
            'Login',
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
