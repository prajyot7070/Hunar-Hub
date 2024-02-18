import 'bloc/user_register_bloc.dart';
import 'models/user_register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/core/utils/validation_functions.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../android_small_five_screen/android_small_five_screen.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<UserRegisterBloc>(
      create: (context) => UserRegisterBloc(UserRegisterState(
        userRegisterModelObj: UserRegisterModel(),
      ))
        ..add(UserRegisterInitialEvent()),
      child: UserRegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.deepPurple200,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img86622841,
                      height: 211.v,
                      width: 208.h,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 133.v),
                    ),
                    _buildUserRegisterForm(context),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 588.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgUntitledDesign,
                              height: 588.v,
                              width: 360.h,
                              alignment: Alignment.center,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 36.v,
                                width: 279.h,
                                margin: EdgeInsets.only(bottom: 52.v),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 36.v,
                                        width: 279.h,
                                        decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme.onPrimaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            18.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        String email =
                                            emailController.text.trim();
                                        String password =
                                            passwordController.text.trim();

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AndroidSmallFiveScreen.builder(
                                              context,
                                              email: email,
                                              password: password,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "lbl_next".tr,
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 223.h,
                        margin: EdgeInsets.only(top: 28.v),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_sign_up".tr,
                                style:
                                    CustomTextStyles.displayMediumInikaff372e5d,
                              ),
                              TextSpan(
                                text: " \n".tr,
                                style:
                                    CustomTextStyles.headlineLargeInikaff4d2d61,
                              ),
                              TextSpan(
                                text: "lbl_to_continue".tr,
                                style:
                                    CustomTextStyles.headlineLargeInikaffffffff,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserRegisterForm(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 18.h,
          right: 21.h,
          bottom: 108.v,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.fillOnPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
