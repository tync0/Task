import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarItem extends StatelessWidget {
  final String svgName;
  final void Function()? onTap;
  final bool check;
  const BottomNavBarItem({
    super.key,
    required this.svgName,
    this.onTap,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        width: 65,
        height: 65,
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: check
              ? Colors.white
              : const Color(0xFFB8B8B8).withOpacity(
                  0.6,
                ),
          border: Border.all(color: const Color(0xFFB8B8B8).withOpacity(0.5)),
        ),
        child: SvgPicture.asset(
          svgName,
          colorFilter: ColorFilter.mode(
            check ? Colors.black : Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
