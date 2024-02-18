import 'package:jaya_s_application3/widgets/app_bar/custom_app_bar.dart';

import 'bloc/worker_register_bloc.dart';
import 'models/worker_register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/core/utils/validation_functions.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jaya_s_application3/presentation/worker_register_two_screen/worker_register_two_screen.dart';

class WorkerRegisterScreen extends StatelessWidget {
  WorkerRegisterScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController(); //email
  final passwordController = TextEditingController(); //password
  final genderController = TextEditingController(); //gender

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<WorkerRegisterBloc>(
      create: (context) => WorkerRegisterBloc(WorkerRegisterState(
        workerRegisterModelObj: WorkerRegisterModel(),
      ))
        ..add(WorkerRegisterInitialEvent()),
      child: WorkerRegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // Wrap scaffold with a container
          color: Colors.blue, // Set background color to blue
          child: SizedBox(
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
                    alignment: Alignment.center,
                    children: [
                      _buildRegisterForm(context),
                      CustomImageView(
                        imagePath: ImageConstant.imgUntitledDesign634x360,
                        height: 634.v,
                        width: 360.h,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  /// Section Widget
  Widget _buildRegisterForm(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 34.h,
          vertical: 100.v, // Increase the vertical padding here
        ),
        // decoration: BoxDecoration(
        //   color: Colors.white, // Change color to white
        //   borderRadius: BorderRadius.circular(20), // Rounded borders
        // ),
        child: Card(
          elevation: 4, // Add elevation to the card
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Rounded borders for the card
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkerRegisterTwoScreen.builder(
                          context,
                          email: email,
                          password: password,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set button background color to blue
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    "lbl_next".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
