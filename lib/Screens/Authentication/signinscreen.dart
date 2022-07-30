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
                                style: GoogleFonts.coiny(textStyle: fontstyle)),
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
                              height: 10,
                            ),
                            _buildIntroText(),
                            const SizedBox(
                              height: 10,
                            ),
                            _phonenumber()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildIntroText() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        const Text(
          "Hi!",
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Les't Get Started.",
          style: TextStyle(
              color: const Color(0xff088F81).withOpacity(0.3),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _phonenumber() {
    return Form(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Enter Phone Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  autofocus: true,
                  cursorColor: const Color(0xff088F81),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xff088F81),
                      )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color(0xff088F81))),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color(0xff088F81))),
                      prefix: SizedBox(
                          width: 60,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+91",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                            ],
                          )),
                      hintText: "Phone Number",
                      filled: true,
                      fillColor: const Color(0xff088F81).withOpacity(0.1)),
                  style:
                      const TextStyle(color: Color(0xff088F81), fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff088F81),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Get OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: const Center(
                  child: Text(
                    "Have a Pin?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff088F81),
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
