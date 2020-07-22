import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'package:parivartan_world/Wrappers/Outline.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Wrapper()
        ))
    );
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            SizedBox(height: queryData.size.height/2.3,),
            Center(
              child: Text("PARIVARTAN", style: GoogleFonts.audiowide(color: Colors.white, fontSize: 50),)
            ),
            /*SizedBox(height: queryData.size.height/4,),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 50,
            )*/
          ],
        ),
      ),
    );
  }
}

