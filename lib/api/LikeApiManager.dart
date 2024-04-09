import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/LikeResponse.dart';

class LikeApiManager {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = '4ca6979ce001f886f30609dd4ec72fde';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

  static Future<LikeResponse> getLikeData(String idCode) async {
    //   https://api.themoviedb.org/3/movie/157336/similar?api_key=4ca6979ce001f886f30609dd4ec72fde

    var url =
        Uri.http(baseUrl, '/3/movie/$idCode/similar', {'api_key': apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    LikeResponse likeResponse = LikeResponse.fromJson(json);
    return likeResponse;
  }
}
