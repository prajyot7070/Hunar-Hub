import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import '../welcome_page_screen/bloc/welcome_page_bloc.dart';
import '../welcome_page_screen/welcome_page_screen.dart';
import '../worker_learner_page/worker_learner_page.dart';
// import 'package:jaya_s_application3/core/app_export.dart';
import '../my_profile_screen/my_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class WorkerSettingsPage extends StatelessWidget {
  const WorkerSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomePageBloc>(
      create: (context) =>
          WelcomePageBloc(WelcomePageInitialState()), // Instantiate the bloc
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  // Navigate to change password screen
                  String? userEmail = FirebaseAuth.instance.currentUser?.email;
                  if (userEmail != null) {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: userEmail);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Reset Password Email Sent'),
                          content: Text(
                              'The reset password email has been sent to your registered email address.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Handle case where user email is null
                    // You might want to show an error message or handle it differently
                  }
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  try {
                    await FirebaseAuth.instance
                        .signOut(); // Sign out the current user
                    // Navigate to login or home screen after logout
                    // For example:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WelcomePageScreen()), // Replace LoginScreen with your login screen widget
                    );
                  } catch (e) {
                    print('Error signing out: $e');
                    // Handle sign out error
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
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
                          WorkerLearnerPage()), // Replace NewPage with your new page widget
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgLock,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyProfileScreen()), // Replace NewPage with your new page widget
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgCheckmark,
              () {
                // Log out
              },
              isActive: true, // Make this button active
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

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Add form fields for changing password here
          ],
        ),
      ),
    );
  }
}
