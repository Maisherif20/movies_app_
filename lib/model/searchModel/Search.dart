import 'SearchResult.dart';

class Search {
  Search({
      this.page, 
      this.code,
      this.message,
      this.searchResult,
      this.totalPages, 
      this.totalResults,});

  Search.fromJson(dynamic json) {
    page = json['page'];

    if (json['results'] != null) {
      searchResult = [];
      json['results'].forEach((v) {
        searchResult?.add(SearchResult.fromJson(v));
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
  List<SearchResult>? searchResult;
  int? totalPages;
  int? totalResults;
Search copyWith({  int? page,
  List<SearchResult>? results,
  int? totalPages,
  int? totalResults,
}) => Search(  page: page ?? this.page,
  searchResult: results ?? this.searchResult,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (searchResult != null) {
      map['results'] = searchResult?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}