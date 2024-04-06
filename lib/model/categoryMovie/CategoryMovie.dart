import 'Results.dart';

class CategoryMovie {
  CategoryMovie({
      this.page, 
      this.results, 
      this.totalPages,
      this.message,
      this.code,
      this.totalResults,});

  CategoryMovie.fromJson(dynamic json) {
    page = json['page'];
    message = json['message'];
    code = json['code'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  String? message;
  String? code;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

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