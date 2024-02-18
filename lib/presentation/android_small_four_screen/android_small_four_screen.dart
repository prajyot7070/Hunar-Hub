import 'bloc/android_small_four_bloc.dart';
import 'models/android_small_four_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';

class AndroidSmallFourScreen extends StatelessWidget {
  const AndroidSmallFourScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AndroidSmallFourBloc>(
      create: (context) => AndroidSmallFourBloc(AndroidSmallFourState(
        androidSmallFourModelObj: AndroidSmallFourModel(),
      ))
        ..add(AndroidSmallFourInitialEvent()),
      child: AndroidSmallFourScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AndroidSmallFourBloc, AndroidSmallFourState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: SizeUtils.height,
              width: 347.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUntitledDesign463x266,
                    height: 463.v,
                    width: 266.h,
                    alignment: Alignment.topLeft,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img126793271,
                    height: 256.adaptSize,
                    width: 256.adaptSize,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
