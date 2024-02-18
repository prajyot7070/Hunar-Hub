import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/core/utils/validation_functions.dart';
import 'package:jaya_s_application3/presentation/android_small_five_screen/bloc/android_small_five_bloc.dart';
import 'package:jaya_s_application3/presentation/android_small_five_screen/models/android_small_five_model.dart';
import 'package:jaya_s_application3/widgets/custom_elevated_button.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_login_screen/user_login_screen.dart';

class AndroidSmallFiveScreen extends StatelessWidget {
  AndroidSmallFiveScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email;
  final String password;
  String _selectedGender = ''; // Variable to hold the selected gender
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context,
      {required String email, required String password}) {
    return BlocProvider<AndroidSmallFiveBloc>(
      create: (context) => AndroidSmallFiveBloc(AndroidSmallFiveState(
        androidSmallFiveModelObj: AndroidSmallFiveModel(),
      ))
        ..add(AndroidSmallFiveInitialEvent()),
      child: AndroidSmallFiveScreen(
        email: email,
        password: password,
      ),
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 222.v,
                        width: 215.h,
                        margin: EdgeInsets.only(top: 18.v),
                        decoration: BoxDecoration(
                          color: appTheme.indigoA100A6,
                          borderRadius: BorderRadius.circular(
                            111.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 578.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgUntitledDesign578x360,
                              height: 578.v,
                              width: 360.h,
                              alignment: Alignment.center,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 19.h,
                                  right: 19.h,
                                  bottom: 62.v,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildFive(context),
                                    SizedBox(height: 13.v),
                                    _buildSubmitButton(context),
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
                        height: 208.v,
                        width: 197.h,
                        margin: EdgeInsets.only(top: 25.v),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 208.v,
                                width: 197.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    104.h,
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.img61830471,
                              height: 160.v,
                              width: 147.h,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 18.h),
                            ),
                          ],
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
  Widget _buildNameEditText(BuildContext context) {
    return BlocSelector<AndroidSmallFiveBloc, AndroidSmallFiveState,
        TextEditingController?>(
      selector: (state) => state.nameEditTextController,
      builder: (context, nameEditTextController) {
        return CustomTextFormField(
          controller: nameEditTextController,
          hintText: "lbl_name".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneEditText(BuildContext context) {
    return BlocSelector<AndroidSmallFiveBloc, AndroidSmallFiveState,
        TextEditingController?>(
      selector: (state) => state.phoneEditTextController,
      builder: (context, phoneEditTextController) {
        return CustomTextFormField(
          controller: phoneEditTextController,
          hintText: "lbl_phone_no".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.phone,
          validator: (value) {
            if (!isValidPhone(value)) {
              return "err_msg_please_enter_valid_phone_number".tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildAgeEditText(BuildContext context) {
    return BlocSelector<AndroidSmallFiveBloc, AndroidSmallFiveState,
        TextEditingController?>(
      selector: (state) => state.ageEditTextController,
      builder: (context, ageEditTextController) {
        return CustomTextFormField(
          controller: ageEditTextController,
          hintText: "lbl_age".tr,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildGenderDropdown(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background color
        borderRadius: BorderRadius.circular(30.0), // Border radius
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedGender.isNotEmpty ? _selectedGender : null,
        onChanged: (value) {
          _selectedGender = value ?? '';
        },
        items: [
          DropdownMenuItem<String>(
            value: '',
            child: Text('Select Gender'),
          ),
          DropdownMenuItem<String>(
            value: 'Male',
            child: Text('Male'),
          ),
          DropdownMenuItem<String>(
            value: 'Female',
            child: Text('Female'),
          ),
          DropdownMenuItem<String>(
            value: 'Other',
            child: Text('Other'),
          ),
        ],
        decoration: InputDecoration(
          hintText: 'lbl_gender'.tr,
          border: InputBorder.none, // Hide default border
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNameEditText(context),
          SizedBox(height: 18.v),
          _buildPhoneEditText(context),
          SizedBox(height: 13.v),
          SizedBox(
            height: 40.v,
            width: 259.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40.v,
                    width: 259.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(
                        18.h,
                      ),
                    ),
                  ),
                ),
                _buildAgeEditText(context),
                SizedBox(height: 18.v),
              ],
            ),
          ),
          SizedBox(height: 17.v),
          _buildGenderDropdown(context),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        
          String name = BlocProvider.of<AndroidSmallFiveBloc>(context)
                  .state
                  .nameEditTextController
                  ?.text
                  .trim() ??
              '';
          String phone = BlocProvider.of<AndroidSmallFiveBloc>(context)
                  .state
                  .phoneEditTextController
                  ?.text
                  .trim() ??
              '';
          String age = BlocProvider.of<AndroidSmallFiveBloc>(context)
                  .state
                  .ageEditTextController
                  ?.text
                  .trim() ??
              '';

          try {
            // Create user in Firebase Authentication
            UserCredential userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );

            // Save additional user data to Firestore
            String userId =
                userCredential.user?.uid ?? ''; // Get the user ID (UID)
            CollectionReference usersRef =
                FirebaseFirestore.instance.collection('users');
            await usersRef.doc(userCredential.user!.uid).set({
              'userId': userId,
              'email': email,
              'password': password,
              'name': name,
              'phone': phone,
              'age': age,
              'gender': _selectedGender,
              'roles': "user",
            });

            // Registration successful, navigate to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserLoginScreen()),
            );
          } catch (e) {
            // Handle registration errors
            print('Error registering user: $e');
          }
        
      },
      text: "lbl_submit".tr,
      margin: EdgeInsets.only(
        left: 20.h,
        right: 18.h,
      ),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientPrimaryToOnPrimaryDecoration,
      buttonTextStyle: theme.textTheme.headlineSmall!,
    );
  }
}

class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Dummy Screen!'),
      ),
    );
  }
}
