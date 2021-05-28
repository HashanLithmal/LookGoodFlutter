import 'package:flutter/material.dart';

//import compo

//import 'package:flutter_look_good_app/components/cart_pord.dart';

class cartProd extends StatefulWidget {
  const cartProd({Key key}) : super(key: key);

  @override
  _cartProdState createState() => _cartProdState();
}

class _cartProdState extends State<cartProd> {

  var productsInCart =
  [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",

      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",

      "price": 50,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",

      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",

      "price": 50,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",

      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",

      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsInCart.length,//length of var
        itemBuilder: (context, index){
          return cart_product(

            prod_name:productsInCart[index]["name"],
            prod_pricture:productsInCart[index]["picture"],
            prod_price:productsInCart[index]["price"],

          );

        }

    );
  }
}

class cart_product extends StatelessWidget {
  // const cart_product({Key key}) : super(key: key);

  final prod_name;
  final prod_pricture;
  final prod_price;


  cart_product({
    this.prod_name,
    this.prod_price,
    this.prod_pricture

  });
  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        //====image in cart list
        leading: new Image.asset(prod_pricture,width: 80,height: 80,),


        //===pro name
        title: new Text(prod_name),
        subtitle:  new Column(

          children: <Widget>[

            new Container(

              alignment:Alignment.topLeft ,
              child: new Text("Rs. ${prod_price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.red,),),

            ),
          ],
        ),
      ),
    );
  }
}
