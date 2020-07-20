import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parivartan_world/Animation/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parivartan_world/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parivartan_world/Views/Home/map.dart';
import 'package:parivartan_world/Views/SignUp.dart';


class SignIn extends StatefulWidget {
 /* final Function toggleView;
  SignIn({this.toggleView });*/
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TapGestureRecognizer _signUp;
  final AuthService _auth  = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  String error = "";


  void _toggle() {
    setState(() {
      _obscureText =!_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _signUp = TapGestureRecognizer()..onTap = () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
    };
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      //key: _scaffoldKey,
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
          children: <Widget>[
            SizedBox(height: queryData.size.height/9,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Welcome back!", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10,),
                        FadeAnimation(1.3, Text("Sign In to your better self!", style: TextStyle(color: Colors.grey, fontSize: 18),)),
                        SizedBox(height: 30,),

                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Colors.indigo.withAlpha(100),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Form(
                            key: _formkey,
                            onChanged: () {_formkey.currentState.validate();},
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    validator: (val) {
                                      if(val.isEmpty)
                                        return 'Empty';
                                      else if(val.length < 3)
                                        return 'Username must can not contain less than 3 letters';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: userNameController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    obscureText: _obscureText,
                                    validator: (val) {
                                      if(val.isEmpty)
                                        return 'Empty';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          _toggle();
                                        },

                                        padding: EdgeInsets.only(left: 6),
                                        icon: Icon(_obscureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.eyeSlash),
                                      ),
                                    ),
                                    controller: passController,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        SizedBox(height: queryData.size.height/25,),
                        FadeAnimation(1.5, Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text("Forgot Password?", style: TextStyle(color: Colors.blueGrey, fontSize: 13,
                                decoration: TextDecoration.underline,),textAlign: TextAlign.right,),
                            ),
                          ],
                        )),
                        SizedBox(height: queryData.size.height/17,),
                        FadeAnimation(1.6, GestureDetector(
                          onTap: () async {
                            if(_formkey.currentState.validate()){
                              setState(() {
                                //loading = true;
                              });
                              dynamic result = await _auth.signInWithUserNameAndPassword(userNameController.text, passController.text);
                              if(result != null){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeMap()));
                              } else {
                                setState(() => error = 'Wrong Email-Address or Password');
                                print(error);
                                //loading = false;
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.indigo[900],
                                    Colors.indigo[500],
                                    Colors.indigo[400]
                                  ]
                                )
                            ),
                            child: Center(
                              child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                        SizedBox(height: queryData.size.height/16,),
                        FadeAnimation(1.7, Container(
                          alignment: Alignment.center,
                          child: Container(
                            //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ", style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: _signUp,
                                  ),

                                ],

                              ),


                            ),
                          ),
                        ),),
                        SizedBox(height: queryData.size.height/24,),
                        Row(
                          children: [
                            Expanded(
                              child: FadeAnimation(1.8, Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  height: queryData.size.height/17,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                  ),
                                  child: Center(
                                    child: RichText(text: TextSpan(text: "Continue with Google   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                                        children: [WidgetSpan(child: FaIcon(FontAwesomeIcons.google, color: Colors.white,), alignment: PlaceholderAlignment.middle),
                                        ]), )
                                  ),
                                ),
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
