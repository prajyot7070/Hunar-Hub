import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import '../my_profile_screen/my_profile_screen.dart';
import '../user_profile_screen/user_profile_screen.dart';
import '../user_settings_page/user_settings_page.dart';
import '../worker_settings_page/worker_settings_page.dart';
import 'package:jaya_s_application3/presentation/my_profile_screen/bloc/my_profile_bloc.dart';
import 'package:jaya_s_application3/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:jaya_s_application3/presentation/my_profile_screen/bloc/my_profile_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'location_service.dart';
import 'location_utils.dart';

import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final LocationService _locationService = LocationService();
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What do you need help with?'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Type the Job You are Looking For...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchForWorkers();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> worker = _searchResults[index];
                String workerName = worker['name'];
                String workerPhone = worker['phone'];
                String gender = worker['gender'];
                List<dynamic> jobs = worker['jobs'];
                double workerLat =
                    worker['latitude'] ?? 0.0; // Default latitude value
                double workerLon =
                    worker['longitude'] ?? 0.0; // Default longitude value
                double workerDistance =
                    worker['distance'] ?? 0.0; // Default distance value
                String workerLocation =
                    worker['location'] ?? ''; // Default location value

                return GestureDetector(
                  onTap: () {
                    // Handle the tap event, show worker details popup
                    _showWorkerDetailsPopup(workerName, workerPhone,
                        workerLocation, workerDistance, gender, jobs);
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workerName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Phone: $workerPhone'),
                          SizedBox(height: 4),
                          Text('Location: $workerLocation'),
                          SizedBox(height: 4),
                          Text(
                              'Distance: ${workerDistance.toStringAsFixed(2)} km'),
                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              // Handle the button press, show worker details popup
                              _showWorkerDetailsPopup(workerName, workerPhone,
                                  workerLocation, workerDistance, gender, jobs);
                            },
                            child: Text('View Details'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Future<void> _searchForWorkers() async {
    String job = _searchController.text.trim().toLowerCase();
    if (job.isNotEmpty) {
      try {
        // Fetch workers who do the searched job from Firestore
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('Worker')
            .where('jobs', arrayContains: job)
            .get();

        // Fetch user location
        Position? userPosition = await _locationService.getCurrentLocation();
        if (userPosition != null) {
          // Initialize list to store worker details along with distances
          List<Map<String, dynamic>> workersWithDistances = [];

          // Calculate distance for each worker and store details
          for (var workerDoc in querySnapshot.docs) {
            Map<String, dynamic> worker =
                workerDoc.data() as Map<String, dynamic>;
            double workerLat = worker['latitude'];
            double workerLon = worker['longitude'];
            double distance = LocationUtils.haversine(
              userPosition.latitude,
              userPosition.longitude,
              workerLat,
              workerLon,
            );

            // Add worker details with distance to the list
            worker['distance'] = distance;
            workersWithDistances.add(worker);
          }

          // Sort workers by distance in ascending order
          workersWithDistances
              .sort((a, b) => a['distance'].compareTo(b['distance']));

          setState(() {
            // Update search results with sorted list of workers
            _searchResults = workersWithDistances;
          });
        } else {
          print('Failed to get user location.');
        }
      } catch (e) {
        print('Error searching for workers: $e');
        // Handle any errors
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              },
              isActive: true,
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgLock,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen(),
                  ),
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgCheckmark,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSettingsPage(),
                  ),
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

  // Method to request location permission
  void _getLocationPermission() async {
    Position? position = await _locationService.getCurrentLocation();
    double lat1 = 18.573956; // Latitude of point 1
    double lon1 = 73.886494; // Longitude of point 1
    double lat2 = 18.6122828; // Latitude of point 2
    double lon2 = 73.8764436; // Longitude of point 2

    double distance = LocationUtils.haversine(lat1, lon1, lat2, lon2);
    print('Distance between the points: $distance kilometers');

    if (position != null) {
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } else {
      print('Failed to get location.');
    }
  }

  void _showWorkerDetailsPopup(
      String workerName,
      String workerPhone,
      String workerLocation,
      double workerDistance,
      String gender,
      List<dynamic> jobs) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(workerName),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Gender: $gender'),
              SizedBox(height: 8),
              Text('Phone: $workerPhone'),
              SizedBox(height: 8),
              Text('Location: $workerLocation'),
              SizedBox(height: 8),
              Text('Distance: ${workerDistance.toStringAsFixed(2)} km'),
              SizedBox(height: 8),
              Text(
                  'Jobs: ${jobs.join(", ")}'), // Join the list of jobs into a string
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
