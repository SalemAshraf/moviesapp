import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/PopularMovies.dart';


class APIManger {
  static const String baseUrl = 'api.themoviedb.org';
  static Future<PopularMovies> getMovie() async {
    //https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=8604d083b68fe27a3700d4838e35174c
    var url = Uri.https(baseUrl, "/3/movie/popular", {
      "apiKey": "8604d083b68fe27a3700d4838e35174c",
    });
    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var popularMovies = PopularMovies.fromJson(json);
      return popularMovies;
    } catch (e) {
      throw e;
    }
  }
}
