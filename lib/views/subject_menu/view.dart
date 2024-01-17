import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadeema_task/core/design/styles.dart';
import '../../features/subject_menu_science/cubit/cubit.dart';
import '../../features/subject_menu_science/cubit/states.dart';

class SubjectMenu extends StatefulWidget {
  const SubjectMenu({super.key});

  @override
  State<SubjectMenu> createState() => _SubjectMenuState();
}

class _SubjectMenuState extends State<SubjectMenu> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScienceSubject>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScienceSubject, ScienceDataStates>(
        builder: (context, state) {
          if (state is GetDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetDataSuccess) {
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.sp,
                  vertical: 20.sp,
                ),
                children: [
                  const Text(
                    "ماده العلوم",
                    style: Styles.textStyleBlack30,
                  ),
                  const Text(
                    "دروسي ",
                    style: Styles.textStyleBlack20,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 11.sp),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.data[index].name,
                          style: Styles.textStyle16,
                        ),
                        Divider(
                          color: const Color(0xffFFC727),
                          endIndent: 130.sp,
                        ),
                        ...List.generate(
                          state.data[index].lessons.length,
                          (ii) => Container(
                            width: 297.w,
                            height: 95.h,
                            margin: EdgeInsetsDirectional.only(
                                top: 20.h, bottom: 15.h),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFAFAFA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: const Color(0x3F000000),
                                  blurRadius: 4.r,
                                  offset: Offset(0.w, 4.h),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                state.data[index].lessons[ii].name,
                                style: Styles.textStyle15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    itemCount: state.data.length,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
