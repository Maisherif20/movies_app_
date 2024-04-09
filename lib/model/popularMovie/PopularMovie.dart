import '../Result.dart';

class PopularMovie {
  PopularMovie({
      this.page, 
      this.code,
      this.message,
      this.results,
      this.totalPages, 
      this.totalResults,});

  PopularMovie.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    code = json['code'];
    message = json['message'];
    totalResults = json['total_results'];
  }
  int? page;
  String? code;
  String? message;
  List<Result>? results;
  int? totalPages;
  int? totalResults;
PopularMovie copyWith({  int? page,
  List<Result>? results,
  int? totalPages,
  int? totalResults,
}) => PopularMovie(  page: page ?? this.page,
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