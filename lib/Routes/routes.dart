import 'package:flutter/material.dart';
import 'package:gameon/Screens/Splash/splashscreen.dart';

import '../Core/Constant/string.dart';

class Routes {
  late int initScreen;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //splash screens
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

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
