import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/ReleasesResponse.dart';

class ReleasesApi {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = '4ca6979ce001f886f30609dd4ec72fde';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

//   /3/movie/upcoming?api_key=

  static Future<ReleasesResponse> getReleases() async {
    var uri = Uri.https(baseUrl, '/3/movie/upcoming', {'api_key': apiKey});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    ReleasesResponse releasesResponse = ReleasesResponse.fromJson(json);
    return releasesResponse;
  }
}
