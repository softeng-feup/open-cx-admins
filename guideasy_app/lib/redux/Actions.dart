import 'package:guideasy_app/model/AppState.dart';

class SavePOIsAction {
  List<dynamic> pointsOfInterest;
  SavePOIsAction(this.pointsOfInterest);
}

class SavePOIsStatusAction {
  RequestStatus status;
  SavePOIsStatusAction(this.status);
}