import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guideasy_app/model/AppState.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, List<PointOfInterest>>(
        converter: (store) => store.state.content['pointsOfInterest'],
        builder: (BuildContext context, List<PointOfInterest> pointsOfInterest) {
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
                labelStyle: Theme
                    .of(context)
                    .textTheme
                    .body2,
                labelText: 'Search room',
              ),
              style: Theme
                  .of(context)
                  .textTheme
                  .body2,
              clearOnSubmit: false,
              itemBuilder: (context, item) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20)),
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
                      Text('10m',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white
                          )),
                    ],
                  ),
                );
              },
              itemFilter: (item, query) {
                bool q1 = item.title
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
                bool q2 = item.title
                    .toLowerCase()
                    .contains(query.toLowerCase());
                bool q3 = item.keyword
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
                bool q4 = item.keyword
                    .toLowerCase()
                    .contains(query.toLowerCase());
                return q1 || q2 || q3 || q4;
              },
              itemSorter: (a, b) {
                return a.title.compareTo(b.title);
              },
              key: key,
              itemSubmitted: (item) {
                setState(() =>
                  searchTextField.textField.controller.text = item.title
                );
              },
              suggestions: pointsOfInterest
          );
          return searchTextField;
        }
    );
  }
}

// TODO problems with searchTextField
// thunk action being called in build
// thunk action being called multiple times