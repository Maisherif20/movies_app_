import 'Results.dart';

class CategoryMovie {
  CategoryMovie({
      this.page, 
      this.results, 
      this.totalPages,
    this.code,
    this.message,
      this.totalResults,});

  CategoryMovie.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    code = json['code'];
    message = json['message'];
  }
  int? page;
  List<Results>? results;
  String? code;
  String? message;
  int? totalPages;
  int? totalResults;
CategoryMovie copyWith({  int? page,
  List<Results>? results,
  int? totalPages,
  int? totalResults,
}) => CategoryMovie(  page: page ?? this.page,
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