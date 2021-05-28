
import 'package:flutter_look_good_assignment/Widgets/customTextField.dart';
import 'package:flutter_look_good_assignment/DialogBox/errorDialog.dart';
import 'package:flutter_look_good_assignment/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_look_good_assignment/pages/home.dart';

import 'package:flutter_look_good_assignment/Config/config.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}





class _LoginState extends State<Login>
{
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    double _screenWidth = MediaQuery.of(context).size.width,_screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/mains/sign.png",
                height: 250.0,
                width: 250.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Enter login details.",
               style: TextStyle(color: Colors.pink.shade900,fontSize: 18.0,),
              ),
            ),


            Form(
              key: _formKey,
              child: Column(
                children: [


                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email_outlined,
                    hintText: "email",
                    isObsecure: false,

                  ),

                  CustomTextField(
                    controller: _passwordTextEditingController,
                    data: Icons.star_sharp,
                    hintText: "password",
                    isObsecure: true,
                  ),

                ],
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            SizedBox(
              width: 200,
              height: 70,
              child: RaisedButton(

                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                onPressed: () {
                  _emailTextEditingController.text.isNotEmpty && _passwordTextEditingController.text.isNotEmpty
                      ? loginUser()
                      : showDialog(
                      context: context,
                      builder: (c)
                      {
                        return ErrorAlertDialog(message: "Please fill all the fields",);
                      }
                  );


                },
                color: Colors.cyan,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),


                child: Text("Sign up", style: TextStyle(color: Colors.black87, fontSize: 20.0),),
              ),
            ),

            SizedBox(
              height: 50.0,
            ),

            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }


  FirebaseAuth _auth = FirebaseAuth.instance;
  void loginUser() async
  {
    showDialog(
        context: context,
        builder: (c)
        {
          return LoadingAlertDialog(message: "Logging in, Please wait...",);
        }
    );

    FirebaseUser firebaseUser;
    await _auth.signInWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    ).then((authUser){
      firebaseUser = authUser.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c)
          {
            return ErrorAlertDialog(message: error.message.toString(),);
          }

      );
    });

    if(firebaseUser != null)
    {
      readData(firebaseUser).then((s){
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => HomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }


  Future readData(FirebaseUser fUser) async
  {
    Firestore.instance.collection("users").document(fUser.uid).get().then((dataSnapshot)
    async {
      await EcomApp.sharedPreferences.setString("uid", dataSnapshot.data[EcomApp.userUID]);
      await EcomApp.sharedPreferences.setString(EcomApp.userEmail, dataSnapshot.data[EcomApp.userEmail]);
      await EcomApp.sharedPreferences.setString(EcomApp.userName, dataSnapshot.data[EcomApp.userName]);
      await EcomApp.sharedPreferences.setString(EcomApp.userAvatarUrl, dataSnapshot.data[EcomApp.userAvatarUrl]);

      List<String> cartlist = dataSnapshot.data[EcomApp.userCartList].cast<String>();
      await EcomApp.sharedPreferences.setStringList(EcomApp.userCartList, cartlist );
    });
  }
}