// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gamemoonwalk/Modules/Model/ThemItem.dart';

import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'http://api.myfeel.me/question/getArrQuestion';

  static List<ThemeItem> parsepost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<ThemeItem> posts =
        list.map((model) => ThemeItem.fromJson(model)).toList();
    return posts;
  }

  static Future<List<ThemeItem>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.https(
        'http://api.myfeel.me/question/getArrQuestion', 'Question=Hows'));

    if (response.statusCode == 200) {
      return compute(parsepost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('can \' get post');
    }
  }
}
