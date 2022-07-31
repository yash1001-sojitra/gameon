import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gameon/Logic/model/ground_model.dart';



class FetchJsonFile {
  Future<Ground> fetchGround() async {
    try {
       String data = await rootBundle.loadString('assets/json/groung.txt');
      var jsonResult = json.decode(data);
      return Ground.fromJson(jsonResult);
    } catch (e) {
      throw Exception('Failed to load Ground');
    }
  }
}