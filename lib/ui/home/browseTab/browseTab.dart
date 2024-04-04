import 'package:flutter/material.dart';
import 'package:movies_app/api/ApiManager.dart';
import 'package:movies_app/ui/home/browseTab/categoryItemWidget.dart';
import 'package:movies_app/ui/home/browseTab/categoryMovieList.dart';

class BrowseTab extends StatefulWidget {

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getGenresMovie(),
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
                          ApiManager.getGenresMovie();
                        },
                        child: Text("Try again"))
                  ],
                ));
          }
          var genresList = snapshot.data?.genres;
          return Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Browse Category ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
                Expanded(
                    child:
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,MoviesListScreen.routeName);
                        setState(() {});
                      },
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context,index) => CategoryItemWidget(name: genresList[index].name!),
                        itemCount: genresList!.length,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
