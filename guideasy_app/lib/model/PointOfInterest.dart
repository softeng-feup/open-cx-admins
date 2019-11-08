class PointOfInterest {
  int id;
  double latitude;
  double longitude;
  String title;
  String description;
  String type;
  String keyword;

  PointOfInterest(
    this.id,
    this.latitude,
    this.longitude,
    this.title,
    this.description,
    this.type,
    this.keyword
  );

  factory PointOfInterest.fromJson(Map<String, dynamic> parsedJson) {
    return PointOfInterest(
      parsedJson['id'],
      parsedJson['latitude'] as double,
      parsedJson['longitude'] as double,
      parsedJson['title'] as String,
      parsedJson['description'] as String,
      parsedJson['type'] as String,
      parsedJson['keyword'] as String
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'latitude' : latitude,
      'longitude' : longitude,
      'title': title,
      'description' : description,
      'type' : type,
      'keyword' : keyword
    };
  }

}