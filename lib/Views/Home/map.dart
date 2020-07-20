import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parivartan_world/Views/Home/Add.dart';
import 'package:parivartan_world/Views/Home/ToDo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Services/auth.dart';
import 'package:parivartan_world/Views/SignIn.dart';



import 'HomePage.dart';


class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {

  static int _page = 0;
  final AuthService _auth = AuthService();

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);

    Widget child;
    switch(_page) {
      case 0: child = Home(); break ;
      case 1: child = Add(); break ;
      case 2: child = ToDo(); break ;

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        brightness: Brightness.dark,
        elevation: 0.0,
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DrawerHeader(
              //height: queryData.size.height/10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/Images/one.jpeg'),
                  //scale: 5,
                  fit: BoxFit.cover
                )
              ),
              child: Center(child: Text("Parivartan", style: GoogleFonts.audiowide(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.indigo))),
            ),
            Container(child: RaisedButton(onPressed: () async {
              try {
                await _auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
              } catch(e) {
                print(e);
              }
            },child: Center(
              child: Text("Sign Out"),
            ),))
             ]
        ),
      ),
      body: child,
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.indigoAccent,
          selectedItemBackgroundColor: Colors.indigo,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: true,
          barHeight: 55,
        ),
        selectedIndex: _page,
        onSelectTab: _onItemTapped,
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.pen,
            label: 'To-Do',
          ),
        ],
      ),

    );
  }
}
