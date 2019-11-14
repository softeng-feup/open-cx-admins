import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';

class SavePOIsAction {
  List<PointOfInterest> pointsOfInterest;
  SavePOIsAction(this.pointsOfInterest);
}

class SavePOIsStatusAction {
  RequestStatus status;
  SavePOIsStatusAction(this.status);
}