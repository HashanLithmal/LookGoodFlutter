import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_look_good_assignment/Authentication/login.dart';

// imports

import 'package:flutter_look_good_assignment/components/horizontal_list.dart';
import 'package:flutter_look_good_assignment/components/products.dart';
import 'package:flutter_look_good_assignment/config/config.dart';
import 'package:flutter_look_good_assignment/counters/cartitemcounter.dart';
import 'package:flutter_look_good_assignment/db/products.dart';
import 'package:flutter_look_good_assignment/helpers/common.dart';
import 'package:flutter_look_good_assignment/pages/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_look_good_assignment/Authentication/authenication.dart';
import 'package:flutter_look_good_assignment/pages/product_details.dart';
import 'package:flutter_look_good_assignment/pages/product_search.dart';
import 'package:flutter_look_good_assignment/provider/app_provider.dart';
import 'package:flutter_look_good_assignment/stores/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_look_good_assignment/provider/product.dart';
import 'package:flutter_look_good_assignment/provider/user.dart';
import 'package:flutter_look_good_assignment/Widgets/product_card.dart';
import 'package:flutter_look_good_assignment/pages/categories.dart';
double width;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductServices productServices=ProductServices();

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    AppProvider appProvider = Provider.of<AppProvider>(context);

    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    Widget image_carousel = new Container(
      height: 160.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/adverts/ad1.png'),
          AssetImage('images/adverts/ad2.png'),
          AssetImage('images/adverts/ad3.png'),
          AssetImage('images/adverts/ad4.png'),
          AssetImage('images/adverts/ad5.png'),
          AssetImage('images/adverts/ad6.png'),
          AssetImage('images/adverts/ad7.png'),
          AssetImage('images/adverts/ad8.png'),
          AssetImage('images/adverts/ad9.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 10000),
        dotSize: 2.0,
        indicatorBgPadding: 1.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        title: Text('Look Good'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {


                Route route = MaterialPageRoute(builder: (c) => CartPage());
                Navigator.pushReplacement(context, route);
              }),

        new  Positioned(
            child: Stack(
              children: [
                Icon(
                  Icons.brightness_1,
                  size: 20.0,
                  color: Colors.green,
                ),
                Positioned(
                  top: 3.0,
                  bottom: 4.0,
                  child: Consumer<CartItemCounter>(
                      builder: (context,counter, _)
                      {
                        return Text(
                          (EcomApp.sharedPreferences.getStringList(EcomApp.userCartList).length-1).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('hashan lithmal'),
              accountEmail: Text(" hashan@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.cyan.shade900),
            ),

//            body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.cyan.shade900),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person, color: Colors.cyan.shade900),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading:
                    Icon(Icons.shopping_basket, color: Colors.cyan.shade900),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartScreen()));
              },
              child: ListTile(
                title: Text('My Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.cyan.shade900),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Categories()));
              },
              child: ListTile(
                title: Text('Categoris'),
                leading: Icon(Icons.dashboard, color: Colors.cyan.shade900),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.cyan.shade900),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.black54),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help_outline, color: Colors.blue),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticScreen()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(
                  Icons.logout,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ],
        ),
      ),

      //body

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Looking for\nnew designs?',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(padding: const EdgeInsets.all(4.0),
             child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      title: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (pattern)async{
                          await productProvider.search(productName: pattern);
                          changeScreen(context, ProductSearchScreen());
                        },
                        decoration: InputDecoration(
                          hintText: "blazer, dress...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ),

            image_carousel,

//           Custom App bar
//            CustomAppBar(),

//          Search Text field
//            Search(),

//            featured products
//removed

            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Categories')),
            ),

            //Horizontal list view begins here
            HorizontalList(),

            //padding widget
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Recent products')),
            ),

            //grid view
            //___  Flexible(child: Products()),

            //          recent products
            Column(
              children: productProvider.products
                  .map((item) => GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails()));
                        },
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
