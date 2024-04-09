import 'package:flutter/material.dart';
import 'package:movies_app/api/releases_api.dart';
import 'package:movies_app/ui/home/homeTab/movie_details/detailes_screen.dart';

class RealeasesWidget extends StatelessWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;
  String id;

  RealeasesWidget({required this.imagePoster, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailesScreen(id: id)));
        },
        child: Container(
          child: Stack(
              // alignment: Alignment.topLeft,
              children: [
                Image.network('${ReleasesApi.imagePath}$imagePoster'),
                InkWell(
                  onTap: () {},
                  child: Stack(alignment: Alignment.center, children: [
                    ImageIcon(
                      AssetImage(
                        'assests/images/save.png',
                      ),
                      color: Color(0xFF514F4F),
                      size: 32,
                    ),
                    Icon(
                      Icons.add,
                      size: 17,
                      color: Colors.white,
                    ),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
