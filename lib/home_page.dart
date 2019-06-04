import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_task/fetch_post_function.dart';

import './photo.dart';
import './second_screen.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoPage();
  }
}
class InfoPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UNSPLASH'),
        ),
        body: Center(
            child: FutureBuilder<List<Photo>>(
                future: fetchPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.data[index].image),
                              ),
                              title: Text(snapshot.data[index].author),
                              subtitle: Text(snapshot.data[index].description),
                              onTap: () {
                               Navigator.pushNamed(context, SecondScreen.routeName,
 arguments: Photo(image: snapshot.data[index].bigImage));
 Divider();
                              });
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })));
  }
}
