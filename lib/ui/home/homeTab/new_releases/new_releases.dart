import 'package:flutter/material.dart';
import 'package:movies_app/api/releases_api.dart';
import 'package:movies_app/model/ReleasesResponse.dart';
import 'package:movies_app/ui/home/homeTab/new_releases/realeases_widget.dart';

class NewReleases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReleasesResponse>(
      future: ReleasesApi.getReleases(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.message == 'error') {
          return Center(
              child: Column(
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          ));
        }
        var resultList = snapshot.data?.results;
        return SizedBox(
          height: 180,
          child: Container(
            color: Color(0xFF707070),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    'New Realeases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: resultList!.length,
                    itemBuilder: (context, index) => RealeasesWidget(
                        imagePoster: resultList![index].posterPath!,
                        id: resultList![index].id.toString()),
                    //       Container(
                    //
                    //   child: Image.network('${ReleasesApi.imagePath}${resultList![index].posterPath!}'),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// releasesItem() {
//   return Container(
//     child: Image.network('${}'),
//   );
// }
}
