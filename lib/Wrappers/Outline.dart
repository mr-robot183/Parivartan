import 'package:flutter/material.dart';
import 'package:parivartan_world/Views/SignIn.dart';
import 'package:parivartan_world/Wrappers/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:parivartan_world/Models/user.dart';
import 'package:parivartan_world/Views/Home/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parivartan_world/Services/auth.dart';


/*
final FirebaseAuth _auth = FirebaseAuth.instance;

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        // send the user to the home page
         HomeMap();
      } else {
        Authenticate();
      }
    });
  }
  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
*/

//listen to auth changes


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
          if (snapshot.hasData){
            FirebaseUser user = snapshot.data; // this is your user instance
            // is because there is user already logged
            return HomeMap();
          }
          // other way there is no user logged.
          return Authenticate();
        }
    );
  }
}

/*
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
final user = Provider.of<User>(context);


    //return either home or authenticate screen
    if (user == null) {
      return Authenticate();
    } else {
      return HomeMap();
    }
  }

}
*/


