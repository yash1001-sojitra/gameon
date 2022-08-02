// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gameon/Core/Constant/string.dart';
// import 'package:gameon/Screens/Dashboard/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../../Logic/widgets/pin_input.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({Key? key}) : super(key: key);

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      Navigator.pushNamed(context, gameondashScreenRoute);
    } else {
      if (status == PermissionStatus.denied) {
        print('Permission denied');
      } else if (status == PermissionStatus.permanentlyDenied) {
        print('Permission Permanently Denied');
        await openAppSettings();
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  final fontstyle = TextStyle(
    fontSize: 18,
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
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/backgroundimage.png"),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(209, 8, 143, 130)),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                scale: 0.9,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Gameon",
                                  style:
                                      GoogleFonts.coiny(textStyle: fontstyle)),
                            ],
                          ),
                        )),
                    Positioned(
                      top: 240,
                      right: 0,
                      left: 0,
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.65,
                          color: Colors.transparent,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              _otpverification()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _otpverification() {
    String number = "9991001999";
    return Form(
      child: Column(
        children: [
          const Text(
            "Enter OTP",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          PinInputField(
            length: 4,
            onFocusChange: (hasFocus) async {
              if (hasFocus) await _scrollToBottomOnKeyboardOpen();
            },
            onSubmit: (enteredOtp) async {},
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "OTP Send to $number",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.watch_later,
                color: Color(0xff088F81),
              ),
              SizedBox(width: 10),
              Text(
                "00:59",
                style: TextStyle(
                    color: Color(0xff088F81), fontWeight: FontWeight.w900),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              requestLocationPermission();
            },
            child: Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff088F81).withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: const Color(0xff088F81),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
