import 'package:flutter/material.dart';

import './photo.dart';
import './second_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoPage();
  }
}

class InfoPage extends State<HomePage> {

  Widget generateWidgetFromPhoto(Photo photo){
    return Row(children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SecondScreen.routeName, arguments: Photo(image: photo.image) );
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(photo.image)
          )
        ),
        SizedBox(width: 10),
        Text(photo.description, style: TextStyle(fontWeight: FontWeight.w300)),
        SizedBox(width: 10),
        Text(photo.author,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontStyle: FontStyle.italic))
      ]);
  }

  List<Widget> generateWidgetsFromPhotos(List<Photo> photos) {
    List<Widget> result = [];
    for(int i =0; i < photos.length; i++ ) {
      result.add(generateWidgetFromPhoto(photos[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var photo = Photo();
    photo.image = 'http://winallos.com/uploads/posts/2014-12/1417410095_fon-priroda-shirokoformatnye-nebo.jpg';
    photo.description = 'this is a picture';
    photo.author = "Vassyan666";

    var photos = [
      photo,
      Photo(
        image: 'https://imagesvc.timeincapp.com/v3/fan/image?url=https%3A%2F%2Fwinteriscoming.net%2Ffiles%2F2018%2F06%2FKings-Landing-GoT.jpg&c=sc&w=736&h=485',
        description: 'King\'s Landing', 
        author: "Jon Snow"
      )
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('unsplash'),
        ),
        body: ListView(children: generateWidgetsFromPhotos(photos)));
  }
}

