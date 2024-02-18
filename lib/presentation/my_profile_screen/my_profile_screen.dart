import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/presentation/my_profile_screen/bloc/my_profile_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaya_s_application3/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:jaya_s_application3/widgets/custom_icon_button.dart';
import 'package:jaya_s_application3/widgets/custom_rating_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import '../worker_learner_page/worker_learner_page.dart';
import '../worker_settings_page/worker_settings_page.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  final locationName = "Dighi,Pune";

  static Widget builder(BuildContext context) {
    return BlocProvider<MyProfileBloc>(
      create: (context) => MyProfileBloc(MyProfileState(
        myProfileModelObj:
            MyProfileModel(name: '', phone: '', location: '', gender: ''),
      ))
        ..add(MyProfileInitialEvent()),
      child: MyProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    getLocationCoordinates(locationName).then((coordinates) {
      print(
          'PJ neend mein hai lol Latitude: ${coordinates['latitude']}, Longitude: ${coordinates['longitude']}');
    }).catchError((error) {
      print('Error: $error');
    });

    return BlocBuilder<MyProfileBloc, MyProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildProfileGroup(context),
                  SizedBox(height: 4.v),
                  SizedBox(height: 31.v),
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
          return {'latitude': lat, 'longitude': lon};
        }
      }
      return {'error': 'Failed to retrieve coordinates'};
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }

  Future<MyProfileModel> fetchUserProfile() async {
    print("Fetching user profile...");

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      try {
        final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
            await _firestore.collection('Worker').doc(user.uid).get();

        String name = '';
        String phone = '';
        String location = '';
        String gender = '';

        if (docSnapshot.exists) {
          name = docSnapshot.data()?['name'] ?? '';
          phone = docSnapshot.data()?['phone'] ?? '';
          location = docSnapshot.data()?['location'] ?? '';
          gender = docSnapshot.data()?['gender'] ?? '';
        }
        print(name);
        print(phone);

        return MyProfileModel(
            name: name, phone: phone, location: location, gender: gender);
      } catch (e) {
        print('Error fetching user profile: $e');
        return MyProfileModel(name: '', phone: '', location: '', gender: '');
      }
    } else {
      print("User not authenticated.");
      return MyProfileModel(name: '', phone: '', location: '', gender: '');
    }
  }

  Widget _buildProfileGroup(BuildContext context) {
    return FutureBuilder<MyProfileModel>(
      future: fetchUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error fetching user profile: ${snapshot.error}');
        } else {
          final userProfile = snapshot.data;
          print("took data snapshot");
          print(userProfile!.name);
          print(userProfile.phone);
          print(userProfile.location);

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
                              Text(
                                'Location: ${userProfile.location}',
                                style: TextStyle(fontSize: 24),
                              ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkerLearnerPage()),
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgLock,
              () {
                // Navigate to settings page
              },
              isActive: true,
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgCheckmark,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkerSettingsPage()),
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
        color: isActive ? Colors.purple : null,
      ),
    );
  }
}
