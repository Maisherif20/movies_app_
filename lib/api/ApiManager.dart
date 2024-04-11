import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/popularMovie/PopularMovie.dart';
import 'package:movies_app/model/categoryMovie/CategoryMovie.dart';
import 'package:movies_app/model/genresMovies/GenresMovies.dart';
import 'package:movies_app/model/searchModel/Search.dart';

import '../model/recommendedMovie/RecommendedMovie.dart';
class ApiManager{
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

  static Future<RecommendedMovie>getRecommendedMovies() async {
    var uri = Uri.https(baseUrl,'/3/movie/top_rated',
        {
          'api_key' : apiKey,
        });
    var response = await http.get(uri);
    var json =  jsonDecode(response.body);
    RecommendedMovie results = RecommendedMovie.fromJson(json);
    return results;
  }

  static Future<Search>searchForMovie(String query)async{
    var uri=Uri.https(baseUrl , "/3/search/movie",{
      "api_key":apiKey,
      "query":query,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    Search search = Search.fromJson(json);
    return search;
  }

  static Future<GenresMovies>getGenresMovie()async{
    var uri=Uri.https(baseUrl , "/3/genre/movie/list",{
      "api_key":apiKey,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    GenresMovies genresMovies = GenresMovies.fromJson(json);
    return genresMovies;
  }

  static Future<CategoryMovie> getCategoryMovieList(int withGenres)async{
    var uri=Uri.https(baseUrl , "/3/discover/movie",{
      "api_key":apiKey,
      "with_genres":withGenres.toString(),
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    CategoryMovie categoryMovie = CategoryMovie.fromJson(json);
    return categoryMovie;
  }

}