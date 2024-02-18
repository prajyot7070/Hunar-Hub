import 'bloc/worker_login_bloc.dart';
import 'models/worker_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/core/utils/validation_functions.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import '../worker_register_screen/worker_register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../my_profile_screen/my_profile_screen.dart';

class WorkerLoginScreen extends StatelessWidget {
  WorkerLoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<WorkerLoginBloc>(
      create: (context) => WorkerLoginBloc(WorkerLoginState(
        workerLoginModelObj: WorkerLoginModel(),
      ))
        ..add(WorkerLoginInitialEvent()),
      child: WorkerLoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
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
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.h,
                        vertical: 13.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder30,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 23.v),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 43.h),
                              child: Text(
                                "lbl_welcome_back".tr,
                                style: CustomTextStyles
                                    .headlineSmallOnPrimaryContainer,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.h,
                              right: 3.h,
                            ),
                            child: BlocSelector<WorkerLoginBloc,
                                WorkerLoginState, TextEditingController?>(
                              selector: (state) => state.userNameController,
                              builder: (context, userNameController) {
                                return CustomTextFormField(
                                  controller: userNameController,
                                  hintText: "lbl_username".tr,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 19.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.h,
                              right: 3.h,
                            ),
                            child: BlocSelector<WorkerLoginBloc,
                                WorkerLoginState, TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                  controller: passwordController,
                                  hintText: "lbl_password".tr,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 8.v),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.h),
                              child: Text(
                                "msg_forget_password".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),

                          SizedBox(height: 21.v),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                String username =
                                    BlocProvider.of<WorkerLoginBloc>(context)
                                            .state
                                            .userNameController
                                            ?.text
                                            .trim() ??
                                        '';
                                String password =
                                    BlocProvider.of<WorkerLoginBloc>(context)
                                            .state
                                            .passwordController
                                            ?.text
                                            .trim() ??
                                        '';

                                // Sign in user with email and password
                                signInWithEmailAndPassword(
                                    username, password, context);
                              }
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.all(2.h),
                                    decoration: AppDecoration
                                        .gradientPrimaryToOnPrimary
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder18,
                                    ),
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "lbl_login2".tr,
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 18.v),

                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: SizedBox(
                          //     height: 43.v,
                          //     width: 283.h,
                          //     child: Stack(
                          //       alignment: Alignment.topCenter,
                          //       children: [
                          //         Align(
                          //           alignment: Alignment.bottomCenter,
                          //           child: Container(
                          //             padding: EdgeInsets.all(2.h),
                          //             decoration: AppDecoration
                          //                 .gradientDeepPurpleToOnPrimary
                          //                 .copyWith(
                          //               borderRadius:
                          //                   BorderRadiusStyle.roundedBorder18,
                          //             ),
                          //             child: Container(
                          //               height: 36.v,
                          //               width: 279.h,
                          //               decoration: BoxDecoration(
                          //                 color: theme
                          //                     .colorScheme.onPrimaryContainer,
                          //                 borderRadius: BorderRadius.circular(
                          //                   18.h,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Align(
                          //           alignment: Alignment.topCenter,
                          //           child: Text(
                          //             "lbl_login2".tr,
                          //             style: theme.textTheme.headlineSmall,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 8.v),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_new_user".tr,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "lbl_sign_up2".tr,
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to the worker registration screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WorkerRegisterScreen.builder(
                                                  context),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 46.v),
                          Container(
                            height: 6.v,
                            width: 29.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius: BorderRadius.circular(
                                3.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 56.h),
                        child: Text(
                          "lbl_hello_workers".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.v),
                    CustomImageView(
                      imagePath: ImageConstant.img89889131,
                      height: 150.v,
                      width: 155.h,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//GPT - login

  // Function to sign in with email and password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful authentication, retrieve the user's role from Firestore
      String role = await getUserRole(userCredential.user?.uid);

      // Check if the user's role is "worker"
      if (role == 'worker') {
        // User is a worker, navigate to the worker profile screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                // MyProfileScreen(), // Replace with worker profile screen
                MyProfileScreen(),
          ),
        );
      } else {
        // User is not a worker, show an error dialog
        _showErrorDialog1(context, 'Worker account not found.');
      }
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in: $e');
      _showErrorDialog1(
          context, 'Invalid username or password. Please try again.');
    }
  }

// Function to retrieve the user's role from Firestore
  Future<String> getUserRole(String? userId) async {
    try {
      // Retrieve the user document from Firestore using the userId
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Worker')
          .doc(userId)
          .get();

      // Get the role field from the user document
      String role = userDoc['roles'];

      return role;
    } catch (e) {
      // Handle errors
      print('Error getting user role: $e');
      return '';
    }
  }

// Function to show an error dialog.
  void _showErrorDialog1(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Function to show an error dialog.
  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Invalid username or password. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

// Dummy screen as a placeholder for the actual screen you want to navigate to.
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
