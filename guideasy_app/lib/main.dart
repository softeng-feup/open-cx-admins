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
          Center(
            child: Text(
              'Take me to...',
              style: theme.textTheme.display1,
            ),
          ),
          /*GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              HomePageButton(icon: Icons.help_outline),
              HomePageButton(icon: Icons.settings),
              HomePageButton(icon: Icons.local_drink),
            ],
          ),*/
          HomePageButton(icon: Icons.help_outline),
          HomePageButton(icon: Icons.settings),
          HomePageButton(icon: Icons.local_drink),
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
