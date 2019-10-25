import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';

class POIViewModel {
  static List<PointOfInterest> pointsOfInterest;

  static Future loadPOIs() async {
    try {
      pointsOfInterest = new List<PointOfInterest>();

      String jsonString = await rootBundle.loadString('assets/locations_db/locations.json');
      Map parsedJson = json.decode(jsonString);

      var categoryJson = parsedJson['locations'] as List;
      for(int i = 0; i < categoryJson.length; i++) {
        pointsOfInterest.add(new PointOfInterest.fromJson(categoryJson[i]));
      }

    } catch(e) {
      print(e);
    }
  }
}