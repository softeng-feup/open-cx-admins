import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    target: LatLng(41.17765, -8.596625),
    tilt: 0,
    zoom: 18
  );

  void initState() {
    super.initState();

    MarkerId markerId = MarkerId('1');
    Marker newMarker = Marker(
      markerId: markerId,
      position: LatLng(41.17765, -8.596625),
      infoWindow: InfoWindow(title: 'Raid de Giratina Shiny', snippet: 'Super legit')
    );

    setState(() {
      markers[markerId] = newMarker;
    });
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
            onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
            initialCameraPosition: _eventLocation,
            markers: Set<Marker>.of(markers.values),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: _recenterMap,
            label: Text('Recenter Map'),
            icon: Icon(Icons.gps_fixed)
        ),
        endDrawer: new FilterBox(),
    );
  }

  Future<void> _recenterMap() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_eventLocation));
  }
}