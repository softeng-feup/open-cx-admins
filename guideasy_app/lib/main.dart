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
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
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
            flex: 1,
            child: Center(
              child: Text(
                'Take me to...',
                style: theme.textTheme.display1,
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
            flex: 1,
            child: Center(
                child: RoomSearchBar(),
            ),
          ),
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
    return FlatButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
      child: Icon(
          icon,
          color: Theme.of(context).backgroundColor,
          size: 80,

      ),
      onPressed: () {

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
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 100)
        ),
        labelStyle: Theme.of(context).textTheme.body2,
        labelText: 'Search room',
      ),
      onChanged: (input) {
        // do stuff
      },
    );
  }

}
