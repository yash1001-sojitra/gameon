// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:gameon/Screens/Authentication/signinscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignInWithNumber()),
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    scale: 0.8,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gameon",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: const Color(0xff088F81).withOpacity(1),
                        ),
                        Shadow(
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 10.0,
                          color: const Color(0xff088F81).withOpacity(0.50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: //CircularProgressIndicator(),
                        Lottie.asset('assets/json/lodingtrans.json'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          const Color(0xff088F81).withOpacity(1),
          const Color(0xff088F81).withOpacity(0.76)
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/stadiumimage.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
