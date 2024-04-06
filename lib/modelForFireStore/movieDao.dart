import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/modelForFireStore/movie.dart';

class MovieDao {
  static CollectionReference<Movie> getMovieCollection() {
    return FirebaseFirestore.instance.collection("movies").withConverter(
        fromFirestore: (snapshot, options) =>
            Movie.fromFireStore(snapshot.data()),
        toFirestore: (movie, options) => movie.toFireStore());
  }

  static Future<void> addMovieToFireBase(Movie movie) {
    var movieCollection = getMovieCollection();
    var doc = movieCollection.doc();
    movie.id = doc.id;
    return doc.set(movie);
  }
}
