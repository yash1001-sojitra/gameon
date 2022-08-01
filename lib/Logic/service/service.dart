import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gameon/Logic/model/ground_model.dart';



class FetchJsonFile {
  Future<List<Ground>> fetchGround() async {
       String data = await rootBundle.loadString('assets/json/ground.json');
      var jsonResult = json.decode(data);
      // return Ground.fromJson(jsonResult).map;
      return jsonResult.map((data) => Ground.fromJson(data)).toList();
  }
}