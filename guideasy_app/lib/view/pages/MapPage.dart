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
  FilterBox _mapFilterBox;
  bool _pressedFiltersButton = false;
  double _filterBoxHeight;

  static const LatLng _center = const LatLng(41.17765, -8.596625);

  List<String> _filters;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    _filters = ["WC", "Elevators", "Stairs", "Reception", "Lost & Found",
      "Snack Bar", "Coffee Break", "Vending Machine"];
    _filterBoxHeight = MediaQuery.of(context).size.height*0.85;
    _mapFilterBox = new FilterBox();

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
          /*actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _showFilters, color: Colors.white),
          ],*/
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
      endDrawer: _mapFilterBox,
    );
  }

  void _showFilters(){
    //Set State
    _pressedFiltersButton = !_pressedFiltersButton;
    if(_pressedFiltersButton){
      //FilterBox.of(context).opacity = 1.0;
      //_mapFilterBox.height = _filterBoxHeight;
    }else{
      //FilterBox.of(context).opacity = 0.0;
      //_mapFilterBox.height = 0;
    }
  }
}