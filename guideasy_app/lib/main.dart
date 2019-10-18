import 'package:flutter/material.dart';

import 'Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: applicationTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffff9900),
      appBar: AppBar(
        title: Center(
            child: Text(
              'Guideasy',
              style: theme.textTheme.title,
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
                HomePageButton(icon: Icons.help_outline),
                HomePageButton(icon: Icons.settings),
                HomePageButton(icon: Icons.local_drink),
                HomePageButton(icon: Icons.help_outline),
                HomePageButton(icon: Icons.settings),
                HomePageButton(icon: Icons.local_drink),
                HomePageButton(icon: Icons.help_outline),
                HomePageButton(icon: Icons.settings),
                HomePageButton(icon: Icons.local_drink),
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

class HomePageButton extends StatelessWidget {
  final IconData icon;

  HomePageButton({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
      child: Icon(
          icon,
          color: Theme.of(context).backgroundColor,
          size: 80,

      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }
}

class RoomSearchBar extends StatefulWidget {
  @override
  RoomSearchBarState createState() => RoomSearchBarState();
}

class RoomSearchBarState extends State<RoomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
      },
    );
  }
}

class MapSlideButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
          size: 100,
        ),
        onPressed: () {

        },
      ),
    );
  }

}