import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/searchTab/searchView.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(18, 19, 18, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                showSearch(context: context, delegate: SearchView());
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.white, width: 1),
                    color: Color.fromRGBO(81, 79, 79, 1)),
                width: 343,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(Icons.search , color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("Search" ,style:  TextStyle(color: Colors.white24 , fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
