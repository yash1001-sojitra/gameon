// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/Logic/cubit/cubit/ground_cubit.dart';

import 'detailsscreen.dart';

class GameonDash extends StatefulWidget {
  const GameonDash({Key? key}) : super(key: key);

  @override
  State<GameonDash> createState() => _GameonDashState();
}

class _GameonDashState extends State<GameonDash> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GroundCubit>(context).fetchGround();
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color(0xff088F81),
          elevation: 3,
          shadowColor: const Color(0xff088F81),
          title: const Text("Grounds"),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          actions: [
            IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/searchicon.png",
                  height: 30,
                  width: 35,
                  color: Colors.white,
                )),
            IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/settingicon.png",
                  height: 30,
                  width: 35,
                  color: Colors.white,
                ))
          ]),
      drawer: const Drawer(),
      body: BlocBuilder<GroundCubit, GroundState>(
        builder: (context, state) {
          if (state is! GroundLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final ground = state.ground;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate:
                      DateTime.now().add(const Duration(days: 2)),
                  daysCount: 30,
                  selectionColor: const Color(0xff088F81),
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
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
                          "Maharastra, India",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Change >",
                          style: TextStyle(
                              color: Color(0xff088F81),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ground.fields!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GroundDetails(
                                        ground: ground.fields![index],
                                      )));
                        },
                        child: GroundListViewModel(
                          groundname: ground.fields![index].name,
                          groundimage: ground.fields![index].image,
                          address: ground.fields![index].address,
                          pitch_type: ground.fields![index].pitchType,
                        ));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class GroundListViewModel extends StatefulWidget {
  GroundListViewModel(
      {required this.groundname,
      required this.address,
      required this.pitch_type,
      required this.groundimage,
      Key? key})
      : super(key: key);

  String groundname;
  String address;
  String pitch_type;
  String groundimage;

  @override
  State<GroundListViewModel> createState() => _GroundListViewModelState();
}

class _GroundListViewModelState extends State<GroundListViewModel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: SizedBox(
                    width: 100,
                    height: 130,
                    child: Image.network(
                      widget.groundimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("20 over",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            color: const Color(0xff088F81),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "10:00 am",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "1:00 pm",
                          style: TextStyle(color: Colors.grey),
                        )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            color: const Color(0xff088F81),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "4:00 pm",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "30 over",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "2:00 pm",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          "4:00 pm",
                          style: TextStyle(color: Colors.grey),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.groundname,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
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
                    color: Colors.grey,
                  )),
              Text(
                widget.address,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10, top: 0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Pitch type: ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      widget.pitch_type,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
                Row(
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
                      "Navigate",
                      style: TextStyle(
                          color: Color(0xff088F81),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
