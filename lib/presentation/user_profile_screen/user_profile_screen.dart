import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/presentation/user_profile_screen/bloc/user_profile_bloc.dart';
import 'package:jaya_s_application3/presentation/user_profile_screen/models/user_profile_model.dart';
import 'package:jaya_s_application3/widgets/custom_icon_button.dart';
import 'package:jaya_s_application3/widgets/custom_rating_bar.dart';
import 'package:firebase_database/firebase_database.dart'; // Import Firebase database package
import '../user_settings_page/user_settings_page.dart';
import '../worker_learner_page/worker_learner_page.dart';
import '../worker_settings_page/worker_settings_page.dart';
import '../user_home_screen/user_home_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (context) => UserProfileBloc(UserProfileState(
        userProfileModelObj: UserProfileModel(name: '', phone: '', gender: ''),
      ))
        ..add(UserProfileInitialEvent()),
      child: UserProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildProfileGroup(context),
                  SizedBox(height: 4.v),
                  // _buildLocationRow(context), // This method is not defined
                  SizedBox(height: 31.v),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     width: 86.h,
                  //     margin: EdgeInsets.only(left: 15.h),
                  //     child: Text(
                  //       "msg_name_address_age_gender".tr,
                  //       maxLines: 4,
                  //       overflow: TextOverflow.ellipsis,
                  //       style: CustomTextStyles.titleLargeOnError,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

  Future<UserProfileModel> fetchUserProfile() async {
    print("Fetching user profile...");

    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    // Check if the user is authenticated
    if (user != null) {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      try {
        // Query the "Worker" collection with the current user's UID
        final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
            await _firestore.collection('users').doc(user.uid).get();

        // Initialize name and phone variables
        String name = '';
        String phone = '';
        // String location = '';
        String gender = '';

        // Fetching the user document's data
        if (docSnapshot.exists) {
          name = docSnapshot.data()?['name'] ??
              ''; // Using null-aware operators to handle null values
          phone = docSnapshot.data()?['phone'] ?? '';
          // location = docSnapshot.data()?['location'] ?? '';
          gender = docSnapshot.data()?['gender'] ?? '';
        }
        print(name);
        print(phone);
        // print(location);
        print(gender);

        // Return UserProfileModel object with fetched data
        return UserProfileModel(name: name, phone: phone, gender: gender);
      } catch (e) {
        print('Error fetching user profile: $e');
        // Return a default UserProfileModel object if an error occurs
        return UserProfileModel(name: '', phone: '', gender: '');
      }
    } else {
      print("User not authenticated.");
      // Return a default UserProfileModel object if the user is not authenticated
      return UserProfileModel(name: '', phone: '', gender: '');
    }
  }

  Widget _buildProfileGroup(BuildContext context) {
    return FutureBuilder<UserProfileModel>(
      future: fetchUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
        } else if (snapshot.hasError) {
          return Text('Error fetching user profile: ${snapshot.error}');
        } else {
          final userProfile = snapshot.data;
          print("took data snapshot");
          print(userProfile!.name);
          print(userProfile.phone);
          // Display user profile data...

          return SizedBox(
            height: 360.v, // Adjusted height to fit the details
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgStubProfImg,
                  height: 155.v,
                  width: 158.h,
                  alignment: Alignment.topCenter, // Adjusted alignment
                  margin: EdgeInsets.only(top: 30.v), // Adjusted margin
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse7,
                  height: 200.v,
                  width: 450.h,
                  alignment: Alignment.topCenter,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 95.h,
                      right: 95.h,
                      bottom: 30.v,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 5.v,
                    ),
                    decoration:
                        AppDecoration.gradientPrimaryToDeepPurple.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder84,
                    ),
                    child: Container(
                      height: 157.v,
                      width: 158.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(
                          79.h,
                        ),
                      ),
                    ),
                  ),
                ),
                // CustomRatingBar(
                //   alignment: Alignment.,
                //   initialRating: 5,
                // ),
                Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: 450,
                      child: Card(
                        elevation: 6,
                        margin: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${userProfile.name}',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                'Phone: ${userProfile.phone}',
                                style: TextStyle(fontSize: 24),
                              ),
                              // Text(
                              //   'Location: ${userProfile.location}',
                              //   style: TextStyle(fontSize: 24),
                              // ),
                              Text(
                                'Gender: ${userProfile.gender}',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.h),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.h, 7.v, 40.h, 7.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomBarButton(
              context,
              ImageConstant.imgCalculator,
              () {
                // Navigate to the new page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserHomePage()), // Replace NewPage with your new page widget
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgLock,
              () {
                // Navigate to settings page
                // Example:
                // Navigator.of(context).pushNamed('/settings');
              },
              isActive: true, // Make this button active
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgCheckmark,
              () {
                // Navigate to the new page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserSettingsPage()), // Replace NewPage with your new page widget
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarButton(
    BuildContext context,
    String imagePath,
    VoidCallback onPressed, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onPressed,
      child: CustomImageView(
        imagePath: imagePath,
        color: isActive ? Colors.purple : null, // Change color if active
      ),
    );
  }
}
