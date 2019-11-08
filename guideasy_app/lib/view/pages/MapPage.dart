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
  GoogleMapController _controller;

  static const LatLng _center = const LatLng(41.17765, -8.596625);

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
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
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              bearing: 105,
              target: _center,
              tilt: 0,
              zoom: 18,
            ),
        ),
      endDrawer: new FilterBox(),
    );
  }
}