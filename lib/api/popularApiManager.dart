import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/PopularMovie.dart';
class PopularApiManager{
  static const String imagePath="https://image.tmdb.org/t/p/w500";
  static const String baseUrl="api.themoviedb.org";
  static const String apiKey="90552b69d31ee2ed4bca18aa7f656676";
  // static const popularMoviesUrl="https://api.themoviedb.org/3/movie/popular?$apiKey";
  static Future<PopularMovie>getPopularMovies()async{
    var uri=Uri.https(baseUrl , "/3/movie/popular",{
      "api_key":apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    PopularMovie popularMovie = PopularMovie.fromJson(json);
    return popularMovie;
  }
}