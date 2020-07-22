import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Views/Home/Add/AddPage.dart';

class Data {
  String title;
  Data({this.title});
}

class Add extends StatefulWidget {
  /*String title;
  Add({Key key, @required this.title}):super(key:key);*/
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {


  final titles = ['Did Something Good For Environment',
    'Did Something Good For Animals',
    'Did Something Good For Your Country',
    'Contributed To Cleanliness Of Society',
    "Happened To Be Reason For Someone's Smile",
    'Helped Someone In Need',
    'Helped A Poor Person',
    'Did Something For Your Family',
    "Contributed For Society's welfare",
    "Donated To A Charity",
    "Taught Someone Something Good",
    'Other'
  ];

  final titles1 = [
    "Contributed To Your Own Wellness",
    "Learnt Something New",
    "Contributed To Personal Development",
    'Other'
  ];


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: queryData.size.width,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We Hope You Did ",
                    style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Something Good Today',
                    style: GoogleFonts.mavenPro(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: queryData.size.width,
              height: 40,
              child: Center(child: Text("Contribution Towards Change In Society",textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                color: Colors.grey[400]
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, index ) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        final data = Data(title: titles[index]);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(data0: data)));                      },
                      leading: FaIcon(FontAwesomeIcons.solidDotCircle, color: Colors.indigo,),
                      title: Text(titles[index]),
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.indigo,),
                    ),
                  );
                }
        ),
            ),
            Container(
              width: queryData.size.width,
              height: 40,
              child: Center(child: Text("Contribution Towards Personal Development",textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                  color: Colors.grey[400]
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: titles1.length,
                  itemBuilder: (context, index ) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          final data = Data(title: titles1[index]);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(data0: data)));
                        },
                        leading: FaIcon(FontAwesomeIcons.solidDotCircle, color: Colors.indigo,),
                        title: Text(titles1[index]),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.indigo,),
                      ),
                    );
                  }
              ),
            ),
        ]
        ),
      )
    );
  }
}
