import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/model/POIType.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:guideasy_app/redux/Actions.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final POIType type;
  VoidCallback onSelected;

  FilterItem(this.title, this.type, {this.onSelected}) : this.icon = poiTypeIcon(type);

  @override
  FilterItemState createState() => FilterItemState();
}

class FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.content['mapFilters'][widget.type],
      builder: (context, selected) {
        selected = selected == null ? false : selected;
        return Container(
            color: selected ? Colors.orangeAccent : Colors.transparent,
            child: ListTile(
              leading: Icon(widget.icon),
              title: Text(widget.title, style: TextStyle(color: Colors.black,)),
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(new UpdateMapFilterAction(widget.type, !selected));
                if (widget.onSelected != null)
                  widget.onSelected();
              }
            )
         );
      }
    );
  }
}