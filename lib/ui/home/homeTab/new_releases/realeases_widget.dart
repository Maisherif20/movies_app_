import 'package:flutter/material.dart';
import 'package:movies_app/api/releases_api.dart';

class RealeasesWidget extends StatelessWidget {
  //var resultList = snapshot.data?.results;
  String imagePoster;

  RealeasesWidget(this.imagePoster);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
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
    );
  }
}
