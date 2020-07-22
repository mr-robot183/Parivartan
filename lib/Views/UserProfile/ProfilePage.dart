import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Views/Home/map.dart';
import 'package:parivartan_world/Views/UserProfile/Settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final List<String> _gridItem = [

  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: queryData.size.height/2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/india.jpeg'),
                    fit: BoxFit.cover
                  )
                ),

                child: Column(
                  children: [
                    Container(
                      height: queryData.size.height/16,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios, color: Colors.indigo,),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                            },
                            icon: Icon(Icons.settings, color: Colors.indigo,),
                          )
                        ],
                    )
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: queryData.size.height - queryData.size.height/2,
                      width: queryData.size.width/4,
                      decoration: BoxDecoration(
                          border: Border(right: BorderSide(width: 1, color: Colors.grey[400])),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: FloatingActionButton(
                                backgroundColor: Colors.indigo,
                                child: Icon(Icons.add),
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeMap()));
                                },
                              ),
                            ),
                          ),
                          Container(child: Column(
                            children: [
                              Text("45", style: GoogleFonts.raleway(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),),
                              Text("Parivartan Tasks", style: GoogleFonts.athiti(fontSize: 25, color: Colors.black,), textAlign: TextAlign.center,)
                            ],
                          ),),
                          Container(child: Column(
                            children: [
                              Text("45", style: GoogleFonts.raleway(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),),
                              Text("To-Dos", style: GoogleFonts.athiti(fontSize: 25, color: Colors.black,), textAlign: TextAlign.center,)
                            ],
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height: queryData.size.height - queryData.size.height/2,
                      width: 2*(queryData.size.width/3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text("Priyanshu Suandia", style: GoogleFonts.athiti(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                  Text("Born 14th Of October 2020", style: GoogleFonts.athiti(fontSize: 18, color: Colors.black,), textAlign: TextAlign.center,),
                                  SizedBox(height: 10),
                                  Text("This is me testing the bio text widget, this needs to be some long so that it can be tested fully. Parivartan app",
                                  style: GoogleFonts.montserrat(fontSize: 18))
                                ],
                              )),
                          /*Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: _gridItem.map((item) => Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(item)
                                    )
                                  )
                                ),
                              ))
                            ),
                          )*/
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
