import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/redux/Actions.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final String type;
  final Icon icon;
  VoidCallback onSelected;

  FilterItem(this.title, this.type, this.icon, {this.onSelected});

  @override
  FilterItemState createState() => FilterItemState();
}

class FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.content[widget.type],
      builder: (context, selected) {
        selected = selected == null ? false : selected;
        return Container(
            color: selected ? Colors.orangeAccent : Colors.transparent,
            child: ListTile(
              leading: widget.icon,
              title: Text(widget.title, style: TextStyle(color: Colors.black,)),
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(new UpdateMapFilter(widget.type, !selected));
                if (widget.onSelected != null)
                  widget.onSelected();
              }
            )
         );
      }
    );
  }
}