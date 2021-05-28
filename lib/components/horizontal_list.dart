import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/pages/cart.dart';
import 'package:flutter_look_good_assignment/pages/categories.dart';


class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[


          Category(

            image_location: 'images/cats/kids.png',
            image_caption: 'kids',
          ),

          Category(
            image_location: 'images/cats/ladies.png',
            image_caption: 'ladies',
          ),

          Category(
            image_location: 'images/cats/mens.png',
            image_caption: 'mens',
          ),


        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Categories()));
        },
        child: Container(

          width: 80.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 70.0,
                height: 70.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
              )
          ),
        ),
      ),
    );
  }
}