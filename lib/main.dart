import 'package:flutter/material.dart';
import 'package:parivartan_world/Views/Home/map.dart';
import 'package:parivartan_world/Views/Authentication/SignIn.dart';
import 'package:parivartan_world/Views/Authentication/SignUp.dart';
import 'package:parivartan_world/Views/splash.dart';
import 'package:parivartan_world/Views/Authentication/success.dart';
import 'package:parivartan_world/Wrappers/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:parivartan_world/Services/auth.dart';
import 'package:parivartan_world/Models/user.dart';
import 'Views/Home/HomePage.dart';
import 'Wrappers/Outline.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Parivartan ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Splash(),
      );
  }
}
