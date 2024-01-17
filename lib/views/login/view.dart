import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadeema_task/core/design/app_button.dart';
import 'package:sadeema_task/core/design/app_input.dart';
import 'package:sadeema_task/core/design/styles.dart';

import '../subject_menu/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 67.h,
            ),
            const Center(
              child: Text(
                "أهلا وسهلا بعودتك !",
                style: Styles.textStyle14,
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Divider(
              indent: 101.w,
              endIndent: 101.w,
            ),
            SizedBox(
              height: 60.h,
            ),
            const FormWidgets(),
          ],
        ),
      ),
    );
  }
}

class FormWidgets extends StatelessWidget {
  const FormWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 45.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الايميل",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 7.h,
          ),
          const AppInput(),
          SizedBox(
            height: 17.h,
          ),
          Text(
            "الرقم السري",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 7.h,
          ),
          const AppInput(),
          SizedBox(
            height: 21.h,
          ),
          const Text(
            "فقدت كلمه السر ؟",
            style: Styles.textStyle14,
          ),
          SizedBox(
            height: 46.h,
          ),
          Center(
            child: AppButton(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectMenu(),),);
              },
              text: "تسجيل",
              width: 194.w,
            ),
          ),
        ],
      ),
    );
  }
}

