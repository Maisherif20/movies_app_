import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';
import 'package:movies_app/ui/home/browseTab/categoryItemWidget.dart';

class BrowseTab extends StatefulWidget {

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getGenresMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                          ApiManager.getGenresMovie();
                        },
                        child: const Text("Try again"))
                  ],
                ));
          }
          var genresList = snapshot.data?.genres;

          return Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Browse Category ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
            Expanded(child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context,index) => CategoryItemWidget(name: genresList[index].name!, id: genresList[index].id!,),
              itemCount: genresList!.length,
            ),)
          ],
            ),
          );
        }

        );
  }

}
