import 'package:guideasy_app/model/POIType.dart';

class PointOfInterest {
  int id;
  double latitude;
  double longitude;
  String title;
  String description;
  String keyword;
  POIType type;

  PointOfInterest(
    this.id,
    this.latitude,
    this.longitude,
    this.title,
    this.description,
    this.keyword,
    this.type
  );

  factory PointOfInterest.fromJson(Map<String, dynamic> parsedJson) {
    return PointOfInterest(
      parsedJson['id'],
      parsedJson['latitude'] as double,
      parsedJson['longitude'] as double,
      parsedJson['title'] as String,
      parsedJson['description'] as String,
      parsedJson['keyword'] as String,
      stringToPOIType(parsedJson['type'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'latitude' : latitude,
      'longitude' : longitude,
      'title': title,
      'description' : description,
      'keyword' : keyword,
      'type' : type.index
    };
  }

}