import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gameon/Logic/model/ground_model.dart';



class FetchJsonFile {
  Future<Ground> fetchGround() async {
       String data = await rootBundle.loadString('assets/json/ground.json');
      var jsonResult = json.decode(data);
      // print(jsonResult);
      return Ground.fromJson(jsonResult);
  }
}