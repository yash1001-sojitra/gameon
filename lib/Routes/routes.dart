import 'package:flutter/material.dart';
import 'package:gameon/Screens/Authentication/otpverification.dart';
import 'package:gameon/Screens/Authentication/signinscreen.dart';
import 'package:gameon/Screens/Dashboard/dashboard.dart';
import 'package:gameon/Screens/Splash/splashscreen.dart';

import '../Core/Constant/string.dart';

class Routes {
  late int initScreen;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //splash screens
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      //auth screens
      case numberauthScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const SignInWithNumber());

      case otpverificationScreenRoute:
        return MaterialPageRoute(builder: (context) => const Otpverification());

//dash
      case gameondashScreenRoute:
        return MaterialPageRoute(builder: (context) => const GameonDash());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
