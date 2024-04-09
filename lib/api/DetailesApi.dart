import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/DetailesResponse.dart';

class DetailesApi {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = '4ca6979ce001f886f30609dd4ec72fde';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

  //   https://api.themoviedb.org/3/movie/157336?api_key=4ca6979ce001f886f30609dd4ec72fde

  static Future<DetailesResponse> getDetailes(String idNum) async {
    var url = Uri.https(baseUrl, '/3/movie/$idNum', {'api_key': apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    DetailesResponse detailesResponse = DetailesResponse.fromJson(json);
    return detailesResponse;
  }
}
