import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:guideasy_app/view/widgets/FilterItem.dart';

class FilterBox extends StatelessWidget{//StatefulWidget {

    final VoidCallback onChangeFilter;

    FilterBox({this.onChangeFilter});

    @override
    Widget build(BuildContext context) {
      return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 88,
                child: DrawerHeader(
                  child: Text('Filters'),
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Color(0xffff9900),
                  ),
                ),
              ),
              FilterItem('WC', POIType.WC, Icon(Icons.wc), onSelected: this.onChangeFilter),
              FilterItem('Elevators', POIType.ELEVATOR, Icon(Icons.unfold_more), onSelected: this.onChangeFilter),
              FilterItem('Stairs', POIType.STAIRS, Icon(Icons.show_chart), onSelected: this.onChangeFilter),
              FilterItem('Reception', POIType.RECEPTION, Icon(Icons.room_service), onSelected: this.onChangeFilter),
              FilterItem('Lost & Found', POIType.LOST_AND_FOUND, Icon(Icons.find_in_page), onSelected: this.onChangeFilter),
              FilterItem('Snack Bar', POIType.SNACK_BAR, Icon(Icons.restaurant), onSelected: this.onChangeFilter),
              FilterItem('Coffee Break', POIType.COFFEE_BREAK, Icon(Icons.local_cafe), onSelected: this.onChangeFilter),
              FilterItem('Vending Machine', POIType.VENDING_MACHINE, Icon(Icons.kitchen), onSelected: this.onChangeFilter)
            ],
          ),
      );
    }
}