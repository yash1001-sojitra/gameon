import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithNumber extends StatefulWidget {
  const SignInWithNumber({Key? key}) : super(key: key);

  @override
  State<SignInWithNumber> createState() => _SignInWithNumberState();
}

class _SignInWithNumberState extends State<SignInWithNumber> {
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
          child: Stack(
            children: [
              Stack(
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
                                style: GoogleFonts.coiny(textStyle: fontstyle)),
                          ],
                        ),
                      )),
                ],
              ),
              Card(
                child: Container(child: Text("card")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
