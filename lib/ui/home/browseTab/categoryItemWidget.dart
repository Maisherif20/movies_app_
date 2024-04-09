import 'package:flutter/material.dart';
import 'package:movies_app/model/genresMovies/Genres.dart';
import 'package:movies_app/ui/home/browseTab/categoryMovieList.dart';

class CategoryItemWidget extends StatefulWidget {
  String name;
  int id;
  CategoryItemWidget({required this.name,required this.id});
  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClickedCategory(Genres(id:widget.id,name: widget.name),context);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assests/images/defaultImage.png'),
          Text(widget.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white,)),
        ],
      ),
    );
  }
  void onClickedCategory(var arg,context){
    Navigator.pushNamed(context,CategoryMoviesList.routeName,arguments: arg);
    setState(() {
    });
  }
}

