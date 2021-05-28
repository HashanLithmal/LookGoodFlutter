import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_look_good_assignment/config/config.dart';
import 'package:flutter_look_good_assignment/pages/home.dart';
import 'package:flutter_look_good_assignment/stores/storehome.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_look_good_assignment/provider/app_provider.dart';
import 'package:flutter_look_good_assignment/provider/product.dart';
import 'package:flutter_look_good_assignment/provider/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Authentication/authenication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EcomApp.auth = FirebaseAuth.instance;
  EcomApp.firestore=Firestore.instance;
  EcomApp.sharedPreferences = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ChangeNotifierProvider.value(value: AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.cyan.shade900),
      home: SplashScreen(),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 10), () async {
      if (await EcomApp.auth.currentUser() != null) {
        Route route = MaterialPageRoute(
            builder: (_) => HomePage()); //should be rout to home
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (_) => AuthenticScreen());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.cyan, Colors.cyan.shade900],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/mains/applogo.png"),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "welcome to the look good shopping store.",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
