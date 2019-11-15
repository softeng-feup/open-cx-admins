import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              FilterItem('WC', 'wc', Icon(Icons.wc), onSelected: this.onChangeFilter),
              FilterItem('Elevators', 'elevator', Icon(Icons.unfold_more), onSelected: this.onChangeFilter),
              FilterItem('Stairs', 'stairs', Icon(Icons.show_chart), onSelected: this.onChangeFilter),
              FilterItem('Reception', 'reception', Icon(Icons.room_service), onSelected: this.onChangeFilter),
              FilterItem('Lost & Found', 'lost_and_found', Icon(Icons.find_in_page), onSelected: this.onChangeFilter),
              FilterItem('Snack Bar', 'snack_bar', Icon(Icons.restaurant), onSelected: this.onChangeFilter),
              FilterItem('Coffee Break', 'coffee_break', Icon(Icons.local_cafe), onSelected: this.onChangeFilter),
              FilterItem('Vending Machine', 'vending_machine', Icon(Icons.kitchen), onSelected: this.onChangeFilter)
            ],
          ),
      );
    }
}