import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jaya_s_application3/presentation/welcome_page_screen/bloc/welcome_page_bloc.dart';
import 'core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/my_profile_screen/bloc/my_profile_bloc.dart';
import 'presentation/user_login_screen/bloc/user_login_bloc.dart';
import 'presentation/user_profile_screen/bloc/user_profile_bloc.dart';
import 'presentation/user_profile_screen/bloc/user_profile_bloc.dart';

// Import your MyProfileBloc and other necessary dependencies

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  if (kIsWeb) {
    try {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyDdQr6oaX8LdFljyo2l7G7hF5inHlML0_g",
          appId: "1:465857653795:android:f6034765ff6b1257115596",
          messagingSenderId: '465857653795',
          projectId: "hunar-d369d",
        ),
      );
    } catch (e) {
      print("Firebase initialization error: $e");
    }
  } else {
    await Firebase.initializeApp();
  }

  // Set preferred orientations and initialize preferences
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]);

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          // Use MultiBlocProvider for multiple blocs
          providers: [
            BlocProvider<ThemeBloc>(
              // Provide ThemeBloc
              create: (context) => ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
            ),
            BlocProvider<MyProfileBloc>(
              // Provide MyProfileBloc
              create: (context) => MyProfileBloc(MyProfileState()),
            ),
            BlocProvider<WelcomePageBloc>(
              create: (context) => WelcomePageBloc(WelcomePageInitialState()),
            ),
            BlocProvider<UserLoginBloc>(
              create: (context) => UserLoginBloc(UserLoginState()),
            ),
            BlocProvider<UserProfileBloc>(
              create: (context) => UserProfileBloc(UserProfileState()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'jaya_s_application3',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en', ''),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
