import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Views/Authentication/SignIn.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: queryData.size.height/8,),
              Text("CONGRATULATIONS", style: GoogleFonts.fredokaOne(fontSize: 40, color: Colors.indigoAccent, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
              SizedBox(height: queryData.size.height/20,),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/Images/tick.png'),
                      fit: BoxFit.fitWidth
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Your Account Has been Created Successfully.", style: GoogleFonts.aBeeZee(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("Verify Your E-mail And Then Sign In To Start PARIVARTAN ", style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black45, fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  color: Colors.indigo,
                  elevation: 15,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text("Sign In", style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
