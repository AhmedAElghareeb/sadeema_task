import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeema_task/views/login/view.dart';

import 'features/subject_menu_science/cubit/cubit.dart';

void main() {
  runApp(const SadeemaTask());
}

class SadeemaTask extends StatelessWidget {
  const SadeemaTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScienceSubject()..getData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          375,
          812,
        ),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            filledButtonTheme: FilledButtonThemeData(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(
                    200.r,
                  ),
                ),
                backgroundColor: const Color(
                  0xff1F477A,
                ),
              ),
            ),
          ),
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          home: const LoginView(),
        ),
      ),
    );
  }
}
