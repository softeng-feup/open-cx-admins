import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _ConferenceMap createState() => _ConferenceMap();
}

class _ConferenceMap extends State<MapPage> {
  GoogleMapController _controller;

  static const LatLng _center = const LatLng(41.177774, -8.596334);

  List<String> _filters;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    _filters = ["WC", "Elevators", "Stairs", "Reception", "Lost & Found",
      "Snack Bar", "Coffee Break", "Vending Machine"];
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffff9900),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Guideasy',
              style: theme.textTheme.headline,
            )
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _showFilters, color: Colors.white),
          ],
          backgroundColor: Color(0xffff9900),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            bearing: 90,
            target: _center,
            tilt: 0,
            zoom: 17.5,
          ),
        ),
      ),
    );
  }

  void _showFilters(){
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final Iterable<ListTile> tiles = _filters.map(
                (String filter){
              return ListTile(
                title: Text(filter),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
              )
              .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Filters: '),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}