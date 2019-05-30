import 'package:flutter/material.dart';

import './photo.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/extractimage';

  @override
  Widget build(BuildContext context) {
    final Photo picture = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('photo'),
      ),
      body: Image.network(
        picture.image,
        fit: BoxFit.fill,
      )
    );
  }
}
