import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:flutter_look_good_assignment/Config/config.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(



              gradient: new LinearGradient(
                colors: [Colors.cyanAccent.shade700, Colors.cyan.shade900],
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

                  Image.asset("images/mains/logoname.png"),

                  SizedBox(height: 20,),


                ],
              ),

            ),


          ),







          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.vpn_key_rounded, color: Colors.black87,),
                text: "Login",

              ),
              Tab(
                icon: Icon(Icons.how_to_reg_rounded, color: Colors.black87,),
                text: "Register",
              ),
            ],
            indicatorColor: Colors.white12,
            indicatorWeight: 5.0,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(


            image:DecorationImage(

              image: AssetImage("images/mains/backg1.png"),
              fit:BoxFit.cover,
            ),

            gradient: new LinearGradient(
              colors: [Colors.cyanAccent, Colors.cyan.shade900],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

            ),
          ),
          child: TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}
