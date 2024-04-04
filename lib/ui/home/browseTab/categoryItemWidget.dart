import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  String name;
  CategoryItemWidget({required this.name});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assests/images/defaultImage.png'),
        Text(name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white,)),
      ],
    );
  }
}
