import 'bloc/android_small_three_bloc.dart';
import 'models/android_small_three_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';

class AndroidSmallThreeScreen extends StatelessWidget {
  const AndroidSmallThreeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AndroidSmallThreeBloc>(
      create: (context) => AndroidSmallThreeBloc(AndroidSmallThreeState(
        androidSmallThreeModelObj: AndroidSmallThreeModel(),
      ))
        ..add(AndroidSmallThreeInitialEvent()),
      child: AndroidSmallThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AndroidSmallThreeBloc, AndroidSmallThreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: SizeUtils.width,
              height: SizeUtils.height,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgAndroidSmall,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: 353.h,
                padding: EdgeInsets.symmetric(horizontal: 48.h),
                child: CustomImageView(
                  imagePath: ImageConstant.img71698641,
                  height: 256.adaptSize,
                  width: 256.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
