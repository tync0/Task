import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 16, right: 10),
            height: 12,
            width: 12,
            child: SvgPicture.asset(
              svg,
            ),
          ),
          hintText: hintText,
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
    );
  }
}
