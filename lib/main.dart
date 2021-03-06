import 'package:flutter/material.dart';

import 'package:suprimidospt/pages/home.dart';
import 'package:suprimidospt/pages/settings.dart';
import 'package:suprimidospt/pages/delays.dart';
import 'package:suprimidospt/pages/about.dart';
import 'package:suprimidospt/pages/line.dart';
import 'package:suprimidospt/pages/line_stats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suprimidos.pt',
      home: App(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[600],
        accentColor: Colors.blueGrey[600],
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (_) => Settings(),
        '/delays': (_) => Delays(),
        '/about': (_) => About(),
      },
      onGenerateRoute: _getRoute,
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  final List<String> path = settings.name.split('/');
  if (path[0] != '') return null;
  if (path[1] == 'line') {
    if (path[3] == 'stats') {
      return new MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LineStats(
              line: path[2],
              type: path[3],
            ),
      );
    } else {
      return new MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => Line(
              line: path[2],
              type: path[3],
            ),
      );
    }
  }
  return null;
}
