import 'bloc/welcome_page_bloc.dart';
import 'models/welcome_page_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/widgets/custom_elevated_button.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<WelcomePageBloc>(
        create: (context) => WelcomePageBloc(
            WelcomePageState(welcomePageModelObj: WelcomePageModel()))
          ..add(WelcomePageInitialEvent()),
        child: WelcomePageScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomePageBloc, WelcomePageState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.onPrimary,
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 38.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.v),
                        Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: 190.h,
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "lbl_welcome".tr,
                                          style: CustomTextStyles
                                              .displayMediumRegular),
                                      TextSpan(
                                          text: " \n".tr,
                                          style: theme.textTheme.displayMedium),
                                      TextSpan(
                                          text: "lbl_on_board".tr,
                                          style: CustomTextStyles
                                              .headlineLargeff21e2f5)
                                    ]),
                                    textAlign: TextAlign.center))),
                        SizedBox(height: 44.v),
                        CustomImageView(
                            imagePath: ImageConstant.img45936241,
                            height: 212.v,
                            width: 199.h,
                            margin: EdgeInsets.only(right: 19.h)),
                        SizedBox(height: 9.v),
                        CustomElevatedButton(
                            height: 47.v,
                            text: "Get Started >>>".tr,
                            margin: EdgeInsets.only(left: 18.h),
                            buttonStyle: CustomButtonStyles.fillGray,
                            buttonTextStyle:
                                CustomTextStyles.titleLargeInikaBlue800,
                            onPressed: () {
                              loginchoice(context);
                            }),
                        SizedBox(height: 19.v),
                        GestureDetector(
                            onTap: () {
                              navigate_to_login(context);
                            },
                            child: Container(
                                width: 142.h,
                                margin: EdgeInsets.only(right: 62.h),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_have_an_account_cool".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInikaffffffff),
                                      TextSpan(
                                          text: "lbl_log_in".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInikaffc7a2f6),
                                      TextSpan(
                                          text: "lbl_here".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInikaffffffff)
                                    ]),
                                    textAlign: TextAlign.center)))
                      ]))));
    });
  }

  /// Navigates to the loginChoiceScreen when the action is triggered.
  loginchoice(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.loginChoiceScreen,
    );
  }

  /// Navigates to the loginChoiceScreen when the action is triggered.
  navigate_to_login(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginChoiceScreen,
    );
  }
}
