import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parivartan_world/Animation/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parivartan_world/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parivartan_world/Views/SignIn.dart';

class SignUp extends StatefulWidget {
 /* final Function toggleView;
  SignUp({this.toggleView });*/
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _auth  = AuthService();
  final _formkey = GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  String result = "";
  bool loading = false;
  TapGestureRecognizer _signIn;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText =!_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _signIn = TapGestureRecognizer()..onTap = () {
      Navigator.pop(context, MaterialPageRoute(builder: (context) => SignIn()));
    };
  }

  bool validatePass(String value){
    String  pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  } //password verification

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  } //email verification


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
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
                  FadeAnimation(1, Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Welcome to Parivartan!", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                //height: queryData.size.height/1.5,
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
                        FadeAnimation(1.3, Text("Sign Up to your better self!", style: TextStyle(color: Colors.grey, fontSize: 18),)),
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
                                    controller: userNameController,
                                    validator: (val) {
                                      if(val.isEmpty)
                                        return 'Empty';
                                      if(validateEmail(val) == false )
                                        return 'Enter a valid Email-Address';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
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
                                      if(validatePass(val.trim()) == false )
                                        return 'Password is not valid';
                                      return null;
                                    },
                                    controller: passController,
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
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),

                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    obscureText: _obscureText,
                                    validator: (val){
                                      if(val.isEmpty)
                                        return 'Empty';
                                      if(val != passController.text)
                                        return 'The Password Does not match';
                                      return null;
                                    },
                                    controller: confirmPassController,
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),

                        SizedBox(height: queryData.size.height/13,),
                        FadeAnimation(1.6, GestureDetector(
                          onTap: () async {
                            if(_formkey.currentState.validate()) {
                              setState(() {
                                //loading = true;
                              });
                              dynamic result = await _auth.registerWithUserNameAndPassword(userNameController.text, passController.text);
                              print("doin' it");
                              if(result != null){
                                setState(() {
                                  result = 'Your Account has been Successfully created.';
                                  //loading = false;
                                });
                                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                              } else {
                                setState(() {
                                  result = 'Oops! there was an error';
                                  //loading = false;
                                });
                              }
                              print(result);
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
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                        SizedBox(height: queryData.size.height/23,),
                        Container(width: queryData.size.width/2,child: Text(result, textAlign: TextAlign.center, style: TextStyle(color: Colors.red),)),
                        SizedBox(height: queryData.size.height/16,),
                        FadeAnimation(1.7, Container(
                          alignment: Alignment.center,
                          child: Container(
                            //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: RichText(
                              text: TextSpan(
                                text: "Already have an account? ", style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: _signIn,
                                  ),

                                ],

                              ),


                            ),
                          ),
                        ),),
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
