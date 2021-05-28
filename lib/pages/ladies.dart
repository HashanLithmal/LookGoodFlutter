import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/Widgets/product_card.dart';
import 'package:flutter_look_good_assignment/provider/product.dart';
import 'package:provider/provider.dart';




import 'package:flutter_look_good_assignment/pages/cart.dart';


import 'cart.dart';

class Ladies extends StatefulWidget {
  const Ladies({Key key}) : super(key: key);

  @override
  _KidsState createState() => _KidsState();
}

class _KidsState extends State<Ladies> {
  @override
  Widget build(BuildContext context) {


    final productProvider = Provider.of<ProductProvider>(context);//change

    return Scaffold(

      appBar: new AppBar(
        elevation: 0.1,
        title: Text('Look Good'),
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

      // body

      body: SafeArea(

        child: ListView(
          children: <Widget>[


//           Custom App bar
//            CustomAppBar(),

//          Search Text field
//            Search(),

//            featured products
//removed




            //padding widget
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('ladies category')),
            ),



            //          recent products--kids
            Column(
              children: productProvider.products
                  .map((item) => GestureDetector(
                onTap: () async {},
                child: ProductCard(
                  product: item,
                ),
              ))
                  .toList(),
            )

          ],
        ),





      ),


    );
  }
}
