import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/modelForFireStore/movie.dart';

class MovieDao {
  static CollectionReference<Movie> getMovieCollection() {
    return FirebaseFirestore.instance.collection("movies").withConverter(
        fromFirestore: (snapshot, options) =>
            Movie.fromFireStore(snapshot.data()),
        toFirestore: (movie, options) => movie.toFireStore());
  }

  // static Future<void> addMovieToFireBase(Movie movie , String id) async {
  //   var movieCollection = getMovieCollection();
  //   var doc = movieCollection.doc();
  //   movie.id = doc.id;
  //   return doc.set(movie);
  // }
  static Future<void> addMovieToFireBase(Movie movie, String id) async {
    var movieCollection = getMovieCollection();
    var doc = movieCollection.doc(id);
    var docSnapshot = await doc.get();
    if (docSnapshot.exists) {
      print('Document already exists');
      return;
    } else {
      movie.id = id;
      return doc.set(movie);
    }
  }
  static Future<List<Movie>> getAllMovies()async{
    var movieCollection = getMovieCollection();
    var snapShot = await movieCollection.get();
    return snapShot.docs.map((e) => e.data()).toList();

  }
  static Future<void> updateMovie(Movie movie) {
    return getMovieCollection().doc(movie.id).update(movie.toFireStore());
  }
  static Stream<List<Movie>> listenForMovie() async* {
    var movieCollection = getMovieCollection();
    var stream = movieCollection.snapshots();
    yield* stream.
    map((querySnapShot) => querySnapShot.docs.map((e) => e.data()).toList());
  }
  static Future<void> deleteMovie(String movieId)  {
    var movieCollection = getMovieCollection();
    return movieCollection.doc(movieId).delete();
  }
  static Future<bool> checkInFireBase( String id) async {
    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection("movies")
        .doc(id)
        .get();
    return docSnapshot.exists;
  }

}