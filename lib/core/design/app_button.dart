import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeema_task/core/design/styles.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.width, required this.onPress,
  });

  final String text;
  final double width;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(
          width,
          41.h
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle14.copyWith(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}