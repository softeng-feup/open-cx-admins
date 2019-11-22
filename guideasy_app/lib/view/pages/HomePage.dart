import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/model/POIType.dart';
import 'package:guideasy_app/view/widgets/HomePageButton.dart';
import 'package:guideasy_app/view/widgets/MapSlideButton.dart';
import 'package:guideasy_app/view/widgets/RoomSearchBar.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffff9900),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
              'Guideasy',
              style: theme.textTheme.headline,
            )
        ),
        backgroundColor: Color(0xffff9900),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Take me to...',
                style: theme.textTheme.display1,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                  child: RoomSearchBar())
          ),
          Expanded(
            flex: 7,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
              crossAxisCount: 3,
              children: <Widget>[
                HomePageButton(POIType.WC),
                HomePageButton(POIType.ELEVATOR),
                HomePageButton(POIType.STAIRS),
                HomePageButton(POIType.SNACK_BAR),
                HomePageButton(POIType.VENDING_MACHINE),
                HomePageButton(POIType.COFFEE_BREAK),
                HomePageButton(POIType.LOST_AND_FOUND),
                HomePageButton(POIType.RECEPTION),
                HomePageButton(POIType.ROOM),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: MapSlideButton(),
          )
        ],
      ),
    );
  }
}