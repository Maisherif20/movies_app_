import 'Movie.dart';

class RecommendedMovie {
  RecommendedMovie({
    this.page,
    this.status_message,
    this.success,
    this.results,
    this.totalPages,
    this.totalResults,});

  RecommendedMovie.fromJson(dynamic json) {
    page = json['page'];
    status_message = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  String? status_message;
  String? success;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;
  RecommendedMovie copyWith({  int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) => RecommendedMovie(  page: page ?? this.page,
    results: results ?? this.results,
    totalPages: totalPages ?? this.totalPages,
    totalResults: totalResults ?? this.totalResults,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}