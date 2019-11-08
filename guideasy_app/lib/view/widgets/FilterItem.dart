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
  Color color;
  bool pressed = false;

  @override
  void initState() {
    super.initState();

    color = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        leading: widget.icon,
        title: Text(widget.title, style: TextStyle(color: Colors.black,)),
        onTap: () {
          setState(() {
            if(!pressed) {
              color = Colors.orangeAccent;
              pressed = true;
            }
            else {
              color = Colors.transparent;
              pressed = false;
            }
          });
        },
      ),
    );
  }
}