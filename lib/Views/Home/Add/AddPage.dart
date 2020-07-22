import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parivartan_world/Views/Home/Add.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPage extends StatefulWidget {
  final Data data0;
  AddPage({Key key,this.data0}):super(key:key);
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  var _title;

  @override
  void initState() {
    super.initState();
    setState(() {
      _title = widget.data0.title;
    });
  }

  String image (_title) {
    if(_title == 'Did Something Good For Environment')
      return 'Assets/Images/environment.jpeg';
    else if(_title == 'Did Something Good For Animals')
      return 'Assets/Images/animals.jpeg';
    else if(_title == 'Did Something Good For Your Country')
      return 'Assets/Images/india.jpeg';
    else if(_title == 'Contributed To Cleanliness Of Society')
      return 'Assets/Images/clean.jpeg';
    else if(_title == 'Did Something Good For Your Country')
      return 'Assets/Images/india.jpeg';
    else if(_title == 'Did Something Good For Your Country')
      return 'Assets/Images/india.jpeg';
    else if(_title == 'Did Something Good For Your Country')
      return 'Assets/Images/india.jpeg';
    else if(_title == 'Did Something Good For Your Country')
      return 'Assets/Images/india.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.indigo,),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_title, style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.black, decoration: TextDecoration.underline)),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Describe Your Action:", style: GoogleFonts.athiti(fontWeight: FontWeight.normal, fontSize: 26, color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Who Was Benefited?", style: GoogleFonts.athiti(fontWeight: FontWeight.normal, fontSize: 26, color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("How Did You Feel?", style: GoogleFonts.athiti(fontWeight: FontWeight.normal, fontSize: 26, color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: queryData.size.height/2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image(_title)),
                    fit: BoxFit.fitWidth
                  )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
