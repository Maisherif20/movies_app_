import 'Genres.dart';

class GenresMovies {
  GenresMovies({
      this.genres,
    this.code,
    this.message,
  });

  GenresMovies.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }
  List<Genres>? genres;
  String? code;
  String? message;
GenresMovies copyWith({  List<Genres>? genres,
}) => GenresMovies(  genres: genres ?? this.genres,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}