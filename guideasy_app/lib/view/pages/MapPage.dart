import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:guideasy_app/view/widgets/FilterBox.dart';

class MapPage extends StatefulWidget {
  @override
  _ConferenceMap createState() => _ConferenceMap();
}

class _ConferenceMap extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _eventLocation = CameraPosition(
    bearing: 105,
    target: LatLng(41.17785, -8.596625),
    tilt: 0,
    zoom: 18
  );

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffff9900),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Guideasy',
              style: theme.textTheme.headline,
            )
          ),
          backgroundColor: Color(0xffff9900),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          onMapCreated: (GoogleMapController controller)  {
            _controller.complete(controller);
            updateMarkers(context);
          },
          initialCameraPosition: _eventLocation,
          markers: Set<Marker>.of(markers.values),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          indoorViewEnabled: true
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: _recenterMap,
            label: Text('Recenter Map'),
            icon: Icon(Icons.gps_fixed)
        ),
        endDrawer: new FilterBox(onChangeFilter: () {
          updateMarkers(context);
        }),
    );
  }

  Future<void> _recenterMap() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_eventLocation));
  }

  void updateMarkers(BuildContext context) {
    final Map content = StoreProvider.of<AppState>(context).state.content;
    List<PointOfInterest> pointsOfInterest = content['pointsOfInterest'];

    setState(() {
      markers.clear();
    });
    pointsOfInterest.forEach((PointOfInterest poi) {
      if (content['mapFilters'][poi.type] != true) return;

      MarkerId markerId = MarkerId(poi.id.toString());
      Marker newMarker = Marker(
        markerId: markerId,
        position: LatLng(poi.latitude, poi.longitude),
        infoWindow: InfoWindow(
          title: poi.title,
          snippet: poi.description
        )
      );

      setState(() {
        markers[markerId] = newMarker;
      });
    });
  }
}

//TODO
// make sure setState is okay