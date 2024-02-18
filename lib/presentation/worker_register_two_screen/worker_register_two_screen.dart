import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import 'bloc/worker_register_two_bloc.dart';
import 'models/worker_register_two_model.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/core/utils/validation_functions.dart';
import 'package:jaya_s_application3/widgets/custom_elevated_button.dart';
import 'package:jaya_s_application3/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../worker_login_screen/worker_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkerRegisterTwoScreen extends StatefulWidget {
  WorkerRegisterTwoScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email;
  final String password;

  static Widget builder(BuildContext context,
      {required String email, required String password}) {
    return BlocProvider<WorkerRegisterTwoBloc>(
      create: (context) => WorkerRegisterTwoBloc(WorkerRegisterTwoState(
        workerRegisterTwoModelObj: WorkerRegisterTwoModel(),
      ))
        ..add(WorkerRegisterTwoInitialEvent()),
      child: WorkerRegisterTwoScreen(
        email: email,
        password: password,
      ),
    );
  }

  @override
  _WorkerRegisterTwoScreenState createState() =>
      _WorkerRegisterTwoScreenState();
}

class _WorkerRegisterTwoScreenState extends State<WorkerRegisterTwoScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Initialize GlobalKey
  String selectedBoxes = ''; // Initialize selectedBoxes string
  String selectedGender = '';
  // final locationName = "Dighi,Pune";

  Widget _buildJobBox(String value) {
    final bool isSelected = selectedBoxes.contains(value);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedBoxes = selectedBoxes.replaceAll(
                value + ',', ''); // Remove the job name with a comma after it
          } else {
            selectedBoxes +=
                value + ','; // Add the job name with a comma after it
          }
        });
      },
      child: Container(
        height: 122,
        width: 122,
        margin: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.grey,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(6, 9),
            ),
          ],
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 54),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: 329,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              // Your existing widgets
                              _buildUserProfileSection(context),
                              // Align(
                              //   alignment: Alignment.topRight,
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       left: 101.h,
                              //       right: 83.h,
                              //     ),
                              //     padding: EdgeInsets.all(10.h),
                              //     decoration: AppDecoration
                              //         .gradientPrimaryToDeepPurple
                              //         .copyWith(
                              //       borderRadius:
                              //           BorderRadiusStyle.roundedBorder72,
                              //     ),
                              //     // child: Container(
                              //     //   margin: EdgeInsets.only(top: 20.v),
                              //     //   height: 125.adaptSize,
                              //     //   width: 125.adaptSize,
                              //     //   decoration: BoxDecoration(
                              //     //     color: appTheme.blueGray100,
                              //     //     borderRadius: BorderRadius.circular(
                              //     //       62.h,
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //   ),
                              // ),
                              CustomImageView(
                                imagePath: ImageConstant.imgStubProfImg,
                                height: 80.v,
                                width: 80.h,
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(
                                    // top: 0.1.v,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 26),
                        Text(
                          "Jobs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildJobBox("plumber"),
                              _buildJobBox("painter"),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildJobBox("electrician"),
                              _buildJobBox("carpenter"),
                            ],
                          ),
                        ),
                        SizedBox(height: 28),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildJobBox("mistri"),
                              _buildJobBox("house helper"),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          width: 218,
                          child: Text(
                            "Which one are you?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            maxLines: null,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 6),
                        // Your remaining widgets
                        _buildRecentOrdersSection(context),
                        // SizedBox(height: 27.v),
                        // _buildWorkerRegisterTwoSection(context),

                        SizedBox(
                            height: 14
                                .v), // Add the desired spacing between text fields and the button
                        _buildSubmitButton(context), // Add the submit button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.v), // Add margin from the top
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(23.h),
          decoration: AppDecoration.fillErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocSelector<WorkerRegisterTwoBloc, WorkerRegisterTwoState,
                  TextEditingController?>(
                selector: (state) => state.nameController,
                builder: (context, nameController) {
                  return CustomTextFormField(
                    controller: nameController,
                    hintText: "lbl_name".tr,
                    validator: (value) {
                      if (!isText(value)) {
                        return "err_msg_please_enter_valid_text".tr;
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(height: 18.v),
              BlocSelector<WorkerRegisterTwoBloc, WorkerRegisterTwoState,
                  TextEditingController?>(
                selector: (state) => state.phoneController,
                builder: (context, phoneController) {
                  return CustomTextFormField(
                    controller: phoneController,
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
              ),
              SizedBox(height: 14.v),
              BlocSelector<WorkerRegisterTwoBloc, WorkerRegisterTwoState,
                  TextEditingController?>(
                selector: (state) => state.locationController,
                builder: (context, locationController) {
                  return CustomTextFormField(
                    controller: locationController,
                    hintText: "Location".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    //   validator: (value) {
                    //     if (!isValidPhone(value)) {
                    //       return "err_msg_please_enter_valid_qualification".tr;
                    //     }
                    //   return null;
                    // },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderBox(String value, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 122.adaptSize,
        width: 122.adaptSize,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : appTheme.blueGray100,
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentOrdersSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderBox(
                "Male",
                selectedGender == 'Male',
                () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                },
              ),
              SizedBox(width: 20.h), // Add spacing between boxes
              _buildGenderBox(
                "Female",
                selectedGender == 'Female',
                () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getLocationCoordinates(
      String locationName) async {
    final endpoint =
        'https://nominatim.openstreetmap.org/search?q=$locationName&format=json';

    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          final location = data[0];
          final double lat = double.parse(location['lat']);
          final double lon = double.parse(location['lon']);
          print('latitude: $lat, longitude: $lon');
          return {'latitude': lat, 'longitude': lon};
        }
      }
      return {'error': 'Failed to retrieve coordinates'};
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        try {
          // Perform signup with email and password
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: widget.email,
            password: widget.password,
          );

          String name = BlocProvider.of<WorkerRegisterTwoBloc>(context)
                  .state
                  .nameController
                  ?.text
                  .trim() ??
              '';
          String phone = BlocProvider.of<WorkerRegisterTwoBloc>(context)
                  .state
                  .phoneController
                  ?.text
                  .trim() ??
              '';
          String location = BlocProvider.of<WorkerRegisterTwoBloc>(context)
                  .state
                  .locationController
                  ?.text
                  .trim() ??
              '';

          // Get the latitude and longitude based on the location
          Map<String, dynamic> coordinates =
              await getLocationCoordinates(location);
          print(coordinates);
          double latitude = coordinates['latitude'];
          double longitude = coordinates['longitude'];

          // Get the selected job values
          List<String> selectedJobs = selectedBoxes
              .split(',')
              .map((job) => job.trim())
              .toList(); // Split the selectedBoxes string and convert it to a List of strings
          selectedJobs
              .removeWhere((job) => job.isEmpty); // Remove any empty job names

          String gender = selectedGender.trim();

          print('Selected Jobs: $selectedJobs');
          print('longitude: $longitude');
          print('latitude: $latitude');
          // Perform registration operation with email, password, name, phone, etc.
          CollectionReference collRef =
              FirebaseFirestore.instance.collection('Worker');
          String userId =
              userCredential.user?.uid ?? ''; // Get the user ID (UID)
          collRef.doc(userId).set({
            'userId': userId, // Set the user ID as a field (optional)
            'email': widget.email,
            'password': widget.password,
            'name': name,
            'phone': phone,
            'location': location,
            'jobs': selectedJobs,
            'gender': gender,
            'roles': "worker",
            'latitude': latitude,
            'longitude': longitude
            // Add other fields as needed
          }).then((value) {
            // Data added successfully
            print('Data added successfully');
            // Show alert dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Registration Successful"),
                  content: Text("Your registration is successful."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the alert dialog
                        // Navigate to worker login page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorkerLoginScreen.builder(context),
                          ),
                        );
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          }).catchError((error) {
            // Error occurred while adding data
            print('Error adding data: $error');
          });
        } catch (error) {
          // Handle signup errors
          print('Error signing up: $error');
          // Show error message to the user
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error signing up: $error"),
            duration: Duration(seconds: 3),
          ));
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

  /// Section Widget
  Widget _buildWorkerRegisterTwoSection(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Container(
        height: 40.v,
        width: 312.h,
        padding: EdgeInsets.all(2.h),
        decoration: AppDecoration.gradientOnPrimaryToDeepPurple.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder18,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle21,
              height: 36.v,
              width: 307.h,
              radius: BorderRadius.circular(
                18.h,
              ),
              alignment: Alignment.center,
            ),
            Positioned(
              bottom: 0,
              child: _buildSubmitButton(context),
            ),
          ],
        ),
      ),
    );
  }
}
