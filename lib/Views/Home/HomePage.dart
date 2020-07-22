import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Animation/FadeAnimation.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController q1 = new TextEditingController();
  TextEditingController q2 = new TextEditingController();
  TextEditingController q3 = new TextEditingController();
  int currentIndex = 0;

  final List<List<String>> tops = [
    /*[
      'Assets/Images/ForDrawer.jpg',
      'Hugo Boss Oxygen',
      '100 \$'
    ],*/
    [
      'Assets/Images/one.jpeg',
      'Hugo Boss Signature',
      '120 \$'
    ],
    [
      'Assets/Images/ques.jpeg',
      'Casio G-Shock Premium',
      '80 \$'
    ]
  ];

  void _next() {
    setState(() {
      if (currentIndex < tops.length -1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget _indicator(bool isActive) {
      return Expanded(
        child: Container(
          height: 4,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive ? Colors.white : Colors.grey[800]
          ),
        ),
      );
    }

    List<Widget> _buildIndicator() {
      List<Widget> indicators = [];
      for(int i = 0; i < tops.length; i++) {
        if (currentIndex == i) {
          indicators.add(_indicator(true));
        } else {
          indicators.add(_indicator(false));
        }
      }

      return indicators;
    }

    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: queryData.size.width,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onHorizontalDragEnd: (DragEndDetails details) {
                        if (details.velocity.pixelsPerSecond.dx > 0) {
                          _preve();
                        } else if (details.velocity.pixelsPerSecond.dx < 0) {
                          _next();
                        }
                      },
                      child: FadeAnimation(0.8, Center(
                        child: Container(
                          width: queryData.size.width/1.1,
                          height: queryData.size.height/4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(tops[currentIndex][0]),
                                  fit: BoxFit.cover,
                              ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.grey[700].withOpacity(.9),
                                      Colors.grey.withOpacity(.0),
                                    ]
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FadeAnimation(1, Container(
                                  width: 90,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: _buildIndicator(),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "Let's Talk About ",
                      style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Your Day',
                      style: GoogleFonts.mavenPro(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("How was your day?", style: GoogleFonts.athiti(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.indigoAccent.withAlpha(200)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: q1,
                        decoration: InputDecoration(
                            hintText: "ex:",
                            hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Did you notice any problem around you that needs to be solved?", style: GoogleFonts.athiti(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.indigoAccent.withAlpha(200)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: q2,
                        decoration: InputDecoration(
                            hintText: "ex:",
                            hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Can you suggest a solution to the problem mentioned above?", style: GoogleFonts.athiti(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.indigoAccent.withAlpha(200)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: q3,
                        decoration: InputDecoration(
                            hintText: "ex:",
                            hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: Colors.indigo,
                          onPressed: () {},
                          child: Text("Save Report", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: queryData.size.height/3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/Images/ques.jpeg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
