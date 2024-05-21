import 'dart:convert';

import 'package:movie_app/models/movie.dart';

class MovieParser {
  //Static Method a method that can be called inside a class without creating the instance of the class
  static List<Movie> parse(String jsonString) {
    final List<dynamic> parseJsonList = json.decode(jsonString);
    return parseJsonList
        .map((jsonItem) => Movie.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
