import 'package:flutter_look_good_assignment/Authentication/authenication.dart';
import 'package:flutter_look_good_assignment/Config/config.dart';
import 'package:flutter_look_good_assignment/Address/addAddress.dart';
import 'package:flutter_look_good_assignment/pages/home.dart';
import 'package:flutter_look_good_assignment/stores/Search.dart';
import 'package:flutter_look_good_assignment/stores/cart.dart';

import 'package:flutter_look_good_assignment/stores/storehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Colors.black38, Colors.red],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      elevation: 8.0,
                      child: Container(
                        height: 160.0,
                        width: 160.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            EcomApp.sharedPreferences.getString(EcomApp.userAvatarUrl),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      EcomApp.sharedPreferences.getString(EcomApp.userName),
                      style: TextStyle(color: Colors.white, fontSize: 35.0, fontFamily: "Signatra"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0,),
              Container(
                padding: EdgeInsets.only(top: 1.0),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Colors.black38, Colors.red],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),

                child: Column(
                  children: [

                    ListTile(
                      leading: Icon(Icons.home, color: Colors.white,),
                      title: Text("Home", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (c) => HomePage());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),


                    ListTile(
                      leading: Icon(Icons.reorder, color: Colors.white,),
                      title: Text("Categories", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (c) => HomePage());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),


                    ListTile(
                      leading: Icon(Icons.shopping_cart, color: Colors.white,),
                      title: Text("My Cart", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (c) => CartPage());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),

                    ListTile(
                      leading: Icon(Icons.search, color: Colors.white,),
                      title: Text("Contact us", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (c) => SearchProduct());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),

                    ListTile(
                      leading: Icon(Icons.add_location, color: Colors.white,),
                      title: Text("Add new Address", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Route route = MaterialPageRoute(builder: (c) => AddAddress());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),

                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.white,),
                      title: Text("Logout", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        EcomApp.auth.signOut().then((c){
                          Route route = MaterialPageRoute(builder: (c) => AuthenticScreen());
                          Navigator.pushReplacement(context, route);
                        });
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),
                  ],
                ),
              ),
            ],
      ),
    );
  }
}
