import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './photo.dart';

Photo convertMapToPhoto(dynamic info) {
    return Photo(
        image: info['urls']['regular'],
        bigImage: info['urls']['full'],
        description: info['description'] ?? "<no description>",
        author: info['user']['name']);
  }

Future<List<Photo>> fetchPost() async {
  var response =
      await http.get('http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
  var jsonData = json.decode(response.body);    
  return jsonData.map<Photo>(convertMapToPhoto).toList();
}
