import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/pages/home.dart';

import 'net/flutterfire.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  TextEditingController _emailField=TextEditingController();
  TextEditingController _passwordField=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        decoration: BoxDecoration(color: Colors.blueAccent),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextFormField(


              controller: _emailField,
              decoration: InputDecoration(
                hintText: "myemail.com",
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.white
                ),

              ),
            ),
            TextFormField(
              controller: _passwordField,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                labelText: "password",
                labelStyle: TextStyle(
                    color: Colors.white
                ),

              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
child: MaterialButton(
  onPressed: () async {
    bool shouldNavigate =
    await register(_emailField.text, _passwordField.text);

    if (shouldNavigate) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );

    }

  },
  child: Text("Register now"),
),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              child: MaterialButton(
                onPressed: () async {

                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);

                  if (shouldNavigate) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );


                  }
                },
                child: Text("login"),
              ),
            ),
          ],
        ),

      ),
    );
  }
}




