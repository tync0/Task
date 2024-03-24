import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/src/core/extension/extension.dart';

class AuthTextField extends StatelessWidget {
  final String svg, hintText;
  final TextEditingController controller;
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.svg,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscureText = ValueNotifier(hintText == "Password");
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ValueListenableBuilder(
        valueListenable: obscureText,
        builder: (context, value, child) => TextField(
          obscureText: value,
          controller: controller,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus!.unfocus(),
          decoration: InputDecoration(
            suffixIcon: hintText == "Password"
                ? IconButton(
                    icon: Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      obscureText.value = !value;
                    },
                  )
                : null,
            isDense: true,
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 16, right: 10),
              height: 12,
              width: 12,
              child: SvgPicture.asset(
                svg,
              ),
            ),
            hintText: hintText == 'Password'
                ? context.l10n.password
                : context.l10n.username,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: const Color(0xFFD7D7D7).withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
