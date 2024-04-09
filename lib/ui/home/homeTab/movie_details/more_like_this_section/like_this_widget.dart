import 'package:flutter/material.dart';
import 'package:movies_app/api/LikeApiManager.dart';

class LikeThisWidget extends StatelessWidget {
  String imagePoster;
  String id;
  String title;
  String date;
  String vote;

  LikeThisWidget({
    required this.id,
    required this.imagePoster,
    required this.title,
    required this.date,
    required this.vote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Color(0xFF707070),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                  // height: 160,
                  //   width: 80,
                  child: Image.network(
                '${LikeApiManager.imagePath}${imagePoster}',
                height: 150,
              )),
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
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xFFFFBB3B),
                  size: 20,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${vote}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Container(
                width: 80,
                child: Text(
                  '${title}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Row(
              children: [
                Text(
                  '${date}',
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFFB5B4B4),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
