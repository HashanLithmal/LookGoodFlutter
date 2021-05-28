import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/components/cart_prod.dart';
import 'package:flutter_look_good_assignment/pages/kids.dart';
import 'package:flutter_look_good_assignment/pages/ladies.dart';
import 'package:flutter_look_good_assignment/pages/mens.dart';

import 'cart.dart';


class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,

        title: Text('Categories'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartScreen()));
              })

        ],
      ),


      // body=========

      body: Center(



        child: Column(
mainAxisSize: MainAxisSize.min ,

          children: [

            SizedBox(
              width: 300,
              height: 60,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Kids()));

                },

                color: Colors.tealAccent.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

                child: Text("Kids",style: TextStyle(color: Colors.black87, fontSize: 25.0,),),

              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 300,
              height: 60,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mens()));

                },

                color: Colors.tealAccent.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

                child: Text("Mens",style: TextStyle(color: Colors.black87, fontSize: 25.0,),),

              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 300,
              height: 60,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Ladies()));
                },

                color: Colors.tealAccent.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

                child: Text("ladies",style: TextStyle(color: Colors.black87, fontSize: 25.0,),),

              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],


        ),

      )





    );
  }
}