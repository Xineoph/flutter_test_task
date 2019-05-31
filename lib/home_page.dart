import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:convert';

import './photo.dart';
import './second_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoPage();
  }
}

class InfoPage extends State<HomePage> {
  Widget generateWidgetFromPhoto(Photo photo) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SecondScreen.routeName,
                    arguments: Photo(image: photo.image));
              },
              child: CircleAvatar(
                  radius: 30.0, backgroundImage: NetworkImage(photo.image))),
          SizedBox(width: 10),
          Text(photo.description,
              style: TextStyle(fontWeight: FontWeight.w300)),
          SizedBox(width: 10),
          Text(photo.author,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
        ]),
        Divider()
      ],
    );
  }

  List<Widget> generateWidgetsFromPhotos(List<Photo> photos) {
    return photos.map(generateWidgetFromPhoto).toList();
  }

  List photo = <Photo>[
    Photo(
        image:
            'https://images.unsplash.com/photo-1559172897-6f4c3f1128a8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
        description: "picture",
        author: "Jeremy Bishop"),
    Photo(
        image:
            'https://images.unsplash.com/photo-1559157693-c34156e0f8c3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
        description: "picture",
        author: "zmachacek"),
    Photo(
      image:
         'https://images.unsplash.com/photo-1559147625-8a594bd63c9b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
      description: "picture",
      author: "Javardh"),
    Photo(
    image:
          'https://images.unsplash.com/photo-1559143472-b7eaf562af26?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
    description: "picture",
    author: "Adrien prv")
  ];

  // Photo convertMapToPhoto(dynamic info) {
  //   return Photo(
  //       image: info['urls']['regular'],
  //       description: info['description'],
  //       author: info['user']['name']);
  // }

  // List<Photo> getPhotos() {
  //   var s = File('assets/data.json').readAsStringSync();
  //   var data = json.decode(s);
  //   return data.map(convertMapToPhoto).toList();
  // }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        appBar: AppBar(
          title: Text('UNSPLASH'),
        ),
        body: ListView(children: generateWidgetsFromPhotos(photo)));
  }
}
