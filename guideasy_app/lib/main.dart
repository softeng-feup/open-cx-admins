import 'package:flutter/material.dart';
import 'package:guideasy_app/constants.dart';
import 'package:guideasy_app/model/AppState.dart';

import 'Theme.dart';
import 'controller/Routes/Router.dart';

final Store<AppState> state = Store<AppState>(
    appReducers, /* Function defined in the reducers file */
    initialState: new AppState(null),
    middleware: [generalMiddleware]
)

void main() => runApp(GuideasyApp());

class GuideasyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guideasy App',
      theme: applicationTheme,
      initialRoute: splashRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

