import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/model/POIViewModel.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';

class RoomSearchBar extends StatefulWidget {
  @override
  _RoomSearchBarState createState() => _RoomSearchBarState();
}

class _RoomSearchBarState extends State<RoomSearchBar> {

  AutoCompleteTextField searchTextField;
  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<PointOfInterest>> key = new GlobalKey();

  _RoomSearchBarState();

  void _loadData() async {
    await POIViewModel.loadPOIs();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    searchTextField = AutoCompleteTextField<PointOfInterest>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white,
                width: 1
            )
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white,
                width: 1
            )
        ),
        labelStyle: Theme.of(context).textTheme.body2,
        labelText: 'Search room',
      ),
      style: Theme.of(context).textTheme.body2,
      clearOnSubmit: false,
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
            color: Colors.deepOrangeAccent,
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item.keyword,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              Text(item.position,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                )),
            ],
          ),
        );
      },
      itemFilter: (item, query) {
        bool q1 = item.roomNumber
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
        bool q2 = item.keyword
            .toLowerCase()
            .startsWith(query.toLowerCase());
        return q1 || q2;
      },
      itemSorter: (a, b) {
        int aPos = int.parse(a.position.substring(0, a.position.length-2));
        int bPos = int.parse(b.position.substring(0, b.position.length-2));
        return aPos.compareTo(bPos);
      },
      key: key,
      itemSubmitted: (item) {
        setState(() => searchTextField.textField.controller.text = item.keyword);
      },
      suggestions: POIViewModel.pointsOfInterest,
    );
    return searchTextField;
  }
}