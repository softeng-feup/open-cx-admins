import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  decoration: BoxDecoration(
                      color: Color(0xffff9900),
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.wc),
                  title: Text('WC', style: TextStyle(color: Colors.black,)),
                  onTap: () {
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                leading: Icon(Icons.unfold_more),
                title: Text('Elevators', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.show_chart),
                title: Text('Stairs', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.room_service),
                title: Text('Reception', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.find_in_page),
                title: Text('Lost & Found', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.restaurant),
                title: Text('Snack Bar', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.local_cafe),
                title: Text('Coffee Break', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.kitchen),
                title: Text('Vending Machine', style: TextStyle(color: Colors.black,)),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
      );
    }
    /*return Container(
      color: Color(0xffffffff),
      child: ListView(children: divided),
    );*/
  //}
}