import 'package:flutter/material.dart';
import 'package:jaya_s_application3/presentation/user_register_screen/user_register_screen.dart';
import 'package:jaya_s_application3/presentation/android_small_five_screen/android_small_five_screen.dart';
import 'package:jaya_s_application3/presentation/welcome_page_screen/welcome_page_screen.dart';
import 'package:jaya_s_application3/presentation/login_choice_screen/login_choice_screen.dart';
import 'package:jaya_s_application3/presentation/user_login_screen/user_login_screen.dart';
import 'package:jaya_s_application3/presentation/worker_login_screen/worker_login_screen.dart';
import 'package:jaya_s_application3/presentation/android_small_four_screen/android_small_four_screen.dart';
import 'package:jaya_s_application3/presentation/android_small_three_screen/android_small_three_screen.dart';
import 'package:jaya_s_application3/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:jaya_s_application3/presentation/worker_register_screen/worker_register_screen.dart';
import 'package:jaya_s_application3/presentation/worker_register_two_screen/worker_register_two_screen.dart';
import 'package:jaya_s_application3/presentation/learning_page_screen/learning_page_screen.dart';
import 'package:jaya_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String userRegisterScreen = '/user_register_screen';

  static const String androidSmallFiveScreen = '/android_small_five_screen';

  static const String welcomePageScreen = '/welcome_page_screen';

  static const String loginChoiceScreen = '/login_choice_screen';

  static const String userLoginScreen = '/user_login_screen';

  static const String workerLoginScreen = '/worker_login_screen'; // New route for the worker login screen

  static const String androidSmallFourScreen = '/android_small_four_screen';

  static const String androidSmallThreeScreen = '/android_small_three_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String workerRegisterScreen = '/worker_register_screen';

  static const String workerRegisterTwoScreen = '/worker_register_two_screen';

  static const String learningPageScreen = '/learning_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        userRegisterScreen: (context) => UserRegisterScreen.builder(context),
        androidSmallFiveScreen: (context) => AndroidSmallFiveScreen.builder(
              context,
              email:
                  "", // provide appropriate value for email or leave it empty
              password:
                  "", // provide appropriate value for password or leave it empty
            ),
        welcomePageScreen: (context) => WelcomePageScreen.builder(context),
        loginChoiceScreen: (context) => LoginChoiceScreen.builder(context),
        userLoginScreen: (context) => UserLoginScreen.builder(context),
        workerLoginScreen: (context) => WorkerLoginScreen.builder(context), // Updated route for the worker login screen
        androidSmallFourScreen: (context) =>
            AndroidSmallFourScreen.builder(context),
        androidSmallThreeScreen: (context) =>
            AndroidSmallThreeScreen.builder(context),
        myProfileScreen: (context) => MyProfileScreen.builder(context),
        

        workerRegisterScreen: (context) =>
            WorkerRegisterScreen.builder(context),
        workerRegisterTwoScreen: (context) => WorkerRegisterTwoScreen.builder(
            context,
              email:
                  "", // provide appropriate value for email or leave it empty
              password:
                  "", // provide appropriate value for password or leave it empty
            ),
        learningPageScreen: (context) => LearningPageScreen.builder(context),
        appNavigationScreen: (context) => AppNavigationScreen.builder(context),
        initialRoute: (context) => WelcomePageScreen.builder(context),
      };
}
