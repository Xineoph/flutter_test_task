import 'package:flutter/material.dart';

import './home_page.dart';
import './second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
      routes: {
        SecondScreen.routeName: (context) => SecondScreen(),
      },
    );
  }
}

