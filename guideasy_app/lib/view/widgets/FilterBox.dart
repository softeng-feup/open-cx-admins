import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBox extends StatefulWidget {
  final List<String> filters;

  FilterBox({this.filters});

  @override
  _FilterBoxState createState() => _FilterBoxState();//new _FilterBoxState(height);
}

class _FilterBoxState extends State<FilterBox>{
  double opacity = 0.0;

  //_FilterBoxState(this.height);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final Iterable<ListTile> tiles = widget.filters.map(
          (String filter){
        return ListTile(
          title: Text(filter,
          style: TextStyle(color: Color(0xffff9900)),
          ),
        );
      },
    );
    final List<Widget> divided = ListTile
        .divideTiles(
          context: context,
          tiles: tiles,
        )
        .toList();

    return Container(
      //color: Color(0x00000000),
      child: Opacity(
        opacity: 0.0,
        child: ListView(children: divided),
      ),
    );
  }
}