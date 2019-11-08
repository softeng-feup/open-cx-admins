import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final Icon icon;

  FilterItem(this.title, this.icon);

  @override
  FilterItemState createState() => FilterItemState();
}

class FilterItemState extends State<FilterItem> {
  Color _color;
  bool _pressed;

  @override
  void initState() {
    super.initState();
    _pressed = false;
    _color = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      child: ListTile(
        leading: widget.icon,
        title: Text(widget.title, style: TextStyle(color: Colors.black,)),
        onTap: () {
          setState(() {
            if(!_pressed) {
              _color = Colors.orangeAccent;
              _pressed = true;
            }
            else {
              _color = Colors.transparent;
              _pressed = false;
            }
          });
        },
      ),
    );
  }
}