import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/searchTab/searchListWidget.dart';

import '../../../api/ApiManager.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchForMovie(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.message == "error") {
            return Center(
                child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.searchForMovie(query);
                    },
                    child: Text("Try again"))
              ],
            ));
          }
          var searchList = snapshot.data?.searchResult;
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => SearchListWdget(
                  title:searchList![index].originalTitle!,
                  image: searchList![index].posterPath!,
                  releaseDate: searchList![index].releaseDate!,
                  overView: searchList![index].overview!,
              ),
              itemCount: searchList?.length ?? 0);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Please Enter Text"),
        ],
      ),
    );
  }
}
