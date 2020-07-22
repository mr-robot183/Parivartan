import 'package:flutter/material.dart';
import 'package:parivartan_world/Animation/FadeAnimation.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: queryData.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.indigo[900],
                  Colors.indigo[500],
                  Colors.indigo[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: queryData.size.height/9,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Forgot Password?", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
