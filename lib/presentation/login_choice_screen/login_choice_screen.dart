import 'bloc/login_choice_bloc.dart';
import 'models/login_choice_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/widgets/custom_elevated_button.dart';

class LoginChoiceScreen extends StatelessWidget {
  const LoginChoiceScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginChoiceBloc>(
        create: (context) => LoginChoiceBloc(
            LoginChoiceState(loginChoiceModelObj: LoginChoiceModel()))
          ..add(LoginChoiceInitialEvent()),
        child: LoginChoiceScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginChoiceBloc, LoginChoiceState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.onPrimary,
              body: SizedBox(
                  height: SizeUtils.height,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    _buildLoginAsServiceProvider(context),
                    _buildTwentyOne(context), // Login as User
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse1,
                        height: 141.v,
                        width: 116.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(bottom: 120.v)),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: 141.v,
                            width: 114.h,
                            margin: EdgeInsets.only(top: 121.v),
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse1141x114,
                                  height: 141.v,
                                  width: 114.h,
                                  alignment: Alignment.center),
                              CustomImageView(
                                  imagePath: ImageConstant.img97963332,
                                  height: 66.v,
                                  width: 62.h,
                                  alignment: Alignment.topLeft,
                                  margin:
                                      EdgeInsets.only(left: 20.h, top: 17.v))
                            ]))),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 208.v,
                            width: 218.h,
                            child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.img66397791,
                                      height: 208.v,
                                      width: 218.h,
                                      alignment: Alignment.center),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 42.v),
                                          child: Text("lbl_or".tr,
                                              style: CustomTextStyles
                                                  .headlineSmallInikaOnPrimaryContainer)))
                                ]))),
                    CustomImageView(
                        imagePath: ImageConstant.img97963332,
                        height: 70.v,
                        width: 67.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 20.h, bottom: 145.v))
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildLoginAsServiceProvider(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 23.h, vertical: 30.v), // Adjusted vertical padding
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 37.v),
            CustomElevatedButton(
              height: 59.v,
              text: "msg_login_as_service".tr,
              margin: EdgeInsets.only(left: 16.h),
              buttonStyle: CustomButtonStyles.fillGrayTL5,
              buttonTextStyle: CustomTextStyles.titleLargeInikaOnPrimary,
              onPressed: () {
                worker_login(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyOne(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: appTheme.deepPurple200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder50),
            child: Container(
                height: 203.v,
                width: double.maxFinite,
                decoration: AppDecoration.fillDeepPurple
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder50),
                child: Stack(alignment: Alignment.bottomRight, children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          height: 69.v,
                          width: 71.h,
                          decoration:
                              BoxDecoration(color: appTheme.deepPurple200))),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          height: 69.v,
                          width: 58.h,
                          decoration:
                              BoxDecoration(color: appTheme.deepPurple200))),
                  CustomElevatedButton(
                      height: 56.v,
                      width: 281.h,
                      text: "lbl_login_as_user".tr,
                      margin: EdgeInsets.only(bottom: 51.v),
                      buttonStyle: CustomButtonStyles.fillGrayTL5,
                      buttonTextStyle:
                          CustomTextStyles.titleLargeInikaOnPrimary,
                      onPressed: () {
                        user_login(context);
                      },
                      alignment: Alignment.bottomCenter)
                ]))));
  }

  /// Navigates to the workerLoginScreen when the action is triggered.
  worker_login(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.workerLoginScreen,
    );
  }

  /// Navigates to the userLoginScreen when the action is triggered.
  user_login(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.userLoginScreen,
    );
  }
}
