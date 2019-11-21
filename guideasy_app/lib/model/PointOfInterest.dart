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

enum POIType {
    STAIRS,
    ELEVATOR,
    WC,
    RECEPTION,
    LOST_AND_FOUND,
    SNACK_BAR,
    COFFEE_BREAK,
    VENDING_MACHINE,
    ROOM,
    UNDEFINED
}

POIType stringToPOIType(String type) {
  switch(type) {
    case 'room':
      return POIType.ROOM;
    case 'stairs':
      return POIType.STAIRS;
    case 'elevator':
      return POIType.ELEVATOR;
    case 'wc':
      return POIType.WC;
    case 'reception':
      return POIType.RECEPTION;
    case 'lost and found':
      return POIType.LOST_AND_FOUND;
    case 'snack bar':
      return POIType.SNACK_BAR;
    case 'coffee break':
      return POIType.COFFEE_BREAK;
    case 'vending machine':
      return POIType.VENDING_MACHINE;
    default:
      return POIType.UNDEFINED;
  }
}