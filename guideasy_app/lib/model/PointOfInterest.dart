class PointOfInterest {
  String keyword;
  int id;
  String roomNumber;
  String position;

  PointOfInterest({
    this.keyword,
    this.id,
    this.roomNumber,
    this.position
  });

  factory PointOfInterest.fromJson(Map<String, dynamic> parsedJson) {
    return PointOfInterest(
      keyword: parsedJson['keyword'] as String,
      id: parsedJson['id'],
      roomNumber: parsedJson['roomNumber'] as String,
      position: parsedJson['position'] as String
    );
  }

}