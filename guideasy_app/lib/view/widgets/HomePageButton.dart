import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guideasy_app/constants.dart';
import 'package:guideasy_app/controller/map_navigation/MapNavigation.dart';
import 'package:guideasy_app/controller/map_navigation/MapPosition.dart';
import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/model/POIType.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';

class HomePageButton extends StatelessWidget {
  final IconData icon;
  final POIType type;

  HomePageButton(this.type) : icon = poiTypeIcon(type);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<PointOfInterest>>(
      converter: (store) => store.state.content["pointsOfInterest"],
      builder: (context, pointsOfInterest) {
        return RaisedButton(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: Theme.of(context).backgroundColor,
            size: 80
          ),
          onPressed: () async {

            Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);

            MapPosition currentPos = MapPosition(position.latitude, position.longitude);
            PointOfInterest target = nearestPOIOfType(currentPos, type, pointsOfInterest);

            if (target == null) {
              print('did not find any POI of that type');
              return;
            }
            print(target.title);

            Navigator.pushNamed(context, mapRoute);
          },
        );
      }
    );
  }
}