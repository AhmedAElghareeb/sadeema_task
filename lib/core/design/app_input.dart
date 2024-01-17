import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.controller,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            200.r,
          ),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: () {
            isHidden = !isHidden;
            setState(() {});
          },
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.transparent.withOpacity(0.4),
          ),
        ) : null,
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
      ),
      maxLines: 1,
      obscureText: isHidden ? true : false,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
    );
  }
}