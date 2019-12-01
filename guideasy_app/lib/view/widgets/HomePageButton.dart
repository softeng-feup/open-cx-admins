import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  HomePageButton(this.type, {Key key}) : icon = poiTypeIcon(type), super(key:key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    var size = media.size;
    return StoreConnector<AppState, List<PointOfInterest>>(
      converter: (store) => store.state.content["pointsOfInterest"],
      builder: (context, pointsOfInterest) {
        return RaisedButton(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
          child: Tooltip(
            message: "Find nearest point of interest",
            child: Icon(
              icon,
              color: Theme.of(context).backgroundColor,
              size: size.width/6
            ),
          ),
          onPressed: () async {
            Position position;
            bool gpsEnabled = await Geolocator().isLocationServiceEnabled();
            if (gpsEnabled)
              position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
            else
              position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);

            if (position == null) {
              Navigator.pushNamed(context, mapRoute);
              Fluttertoast.showToast(
                msg: "Could not determine current position",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.orangeAccent,
                textColor: Colors.white,
                fontSize: 16.0
              );
              return;
            }

            MapPosition currentPos = MapPosition(position.latitude, position.longitude);
            PointOfInterest target = nearestPOIOfType(currentPos, type, pointsOfInterest);

            if (target == null) {
              Navigator.pushNamed(context, mapRoute);
              Fluttertoast.showToast(
                  msg: "Did not find any Point of Interest",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.orangeAccent,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              return;
            }

            Navigator.pushNamed(
                context,
                mapRoute,
                arguments: target);
          },
        );
      }
    );
  }
}