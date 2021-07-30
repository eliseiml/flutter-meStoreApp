import 'package:flutter/material.dart';

Widget customIconButton(
  BuildContext context, {
  required String iconPath,
  void onTap()?,
  required double height,
  required double width,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.translucent,
    child: Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      child: Image.asset(iconPath, height: height, width: width),
    ),
  );
}
