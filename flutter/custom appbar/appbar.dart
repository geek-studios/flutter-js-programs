import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m3homes/view/constants/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    this.prefixIcon,
    required this.backgroundColor,
    this.back = false,
    this.profileIcon = false,
    this.suffixIcon,
  }) : super(key: key);
  final String title;
  final bool back;
  final bool profileIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color backgroundColor;
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: backgroundColor,
      child: Row(
        children: [
          if (back)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          prefixIcon != null ? prefixIcon! : SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    ); // Your custom widget implementation.
  }
}
