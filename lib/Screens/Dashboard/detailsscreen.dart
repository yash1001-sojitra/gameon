// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gameon/Core/Constant/string.dart';
import 'package:gameon/Logic/model/ground_model.dart';
import 'package:gameon/Screens/Dashboard/dashboard.dart';

class GroundDetails extends StatelessWidget {
  GroundDetails({Key? key, required this.ground}) : super(key: key);
    GroundList ground;

  // const GroundDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final detailsData =
    //     ModalRoute.of(context)!.settings.arguments as GroundList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, gameondashScreenRoute);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: const Color(0xff088F81),
        elevation: 3,
        shadowColor: const Color(0xff088F81),
        title: const Text("Grounds"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/calandericon.png",
                      height: 30,
                      width: 35,
                      color: const Color(0xff088F81),
                    )),
                const Text(
                  "Sunday, 21 June 2021",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: 190,
                child: Image.network(
                  ground.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ground.name,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/locationicon.png",
                            height: 30,
                            width: 35,
                            color: const Color(0xff088F81),
                          )),
                      const Text(
                        "Navigate",
                        style: TextStyle(
                            color: Color(0xff088F81),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Pitch type: ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        ground.pitchType,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/foodserviceicon.png",
                            height: 40,
                            width: 45,
                            color: const Color(0xff088F81),
                          )),
                      IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/washserviceicon.png",
                            height: 40,
                            width: 45,
                            color: const Color(0xff088F81),
                          )),
                    ],
                  ),
                  Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color(0xff088F81).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/navigationicon.png",
                              height: 30,
                              width: 35,
                              color: const Color(0xff088F81),
                            )),
                        const Text(
                          "2 Km far.",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const DetailsViewModel();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsViewModel extends StatefulWidget {
  const DetailsViewModel({Key? key}) : super(key: key);

  @override
  State<DetailsViewModel> createState() => _DetailsViewModelState();
}

class _DetailsViewModelState extends State<DetailsViewModel> {
  late bool isballpro = true;
  late bool isumpirepro = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("For 20 overs",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Container(
                    width: 70,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff088F81),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                        child: Text(
                      "10:00 am",
                      style: TextStyle(color: Color(0xff088F81)),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Team 1:",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Mumbai Indians",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              "Booked",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Team 2:",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Available",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color(0xff088F81).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              "Available",
                              style: TextStyle(
                                  color: Color(0xff088F81),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Ball provided"),
                      Checkbox(
                          checkColor: const Color(0xff088F81),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fillColor: MaterialStateProperty.all(
                              Colors.grey.withOpacity(0.2)),
                          value: isballpro,
                          activeColor: Colors.green,
                          onChanged: ((value) {
                            setState(() {
                              isballpro = value!;
                            });
                          })),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Umpire provided",
                        style: TextStyle(fontSize: 13),
                      ),
                      Checkbox(
                          checkColor: const Color(0xff088F81),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fillColor: MaterialStateProperty.all(
                              Colors.grey.withOpacity(0.2)),
                          value: isumpirepro,
                          activeColor: Colors.green,
                          onChanged: ((value) {
                            setState(() {
                              isumpirepro = value!;
                            });
                          })),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Text("Ball Detail:"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Tennis",
                    style: TextStyle(
                        color: Color(0xff088F81), fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\u{20B9}${3000}",
                    style: TextStyle(
                        color: Color(0xff088F81),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                            color: const Color(0xff088F81),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Book now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
