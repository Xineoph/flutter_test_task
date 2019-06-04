import 'package:flutter/material.dart';
import 'package:test_task/photo.dart';
import 'dart:async';


import './home_page.dart';
import './second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<Photo> post;

  MyApp({Key key, this.post}) : super(key: key);

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

