import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/view/widgets/FilterItem.dart';

class FilterBox extends StatelessWidget{//StatefulWidget {
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
              FilterItem('WC', Icon(Icons.wc)),
              FilterItem('Elevators', Icon(Icons.unfold_more)),
              FilterItem('Stairs', Icon(Icons.show_chart)),
              FilterItem('Reception', Icon(Icons.room_service)),
              FilterItem('Lost & Found', Icon(Icons.find_in_page)),
              FilterItem('Snack Bar', Icon(Icons.restaurant)),
              FilterItem('Coffee Break', Icon(Icons.local_cafe)),
              FilterItem('Vending Machine', Icon(Icons.kitchen))
            ],
          ),
      );
    }
}