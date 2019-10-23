import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomSearchBar extends StatefulWidget {
  @override
  RoomSearchBarState createState() => RoomSearchBarState();
}

class RoomSearchBarState extends State<RoomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextfield(
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
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
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.body2,
      onChanged: (input) {
        // do stuff
        print("Searching for " + input);
      },
    );
  }
}