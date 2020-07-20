import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parivartan_world/Models/ToDo.dart';


class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);

    final List <String> toDo =  [
      'one',
      'two',
      'one',
      'two',
      'one',
      'two',
      'one',
      'two',
      'one',
      'two',
    ];

    void _addTodoItem() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddToDo()));    }

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
                    "Make Targets For Yourself,",
                    style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Make To-Dos',
                    style: GoogleFonts.mavenPro(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: toDo.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(toDo[index]),
                    ),
                  );
              })
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: queryData.size.width/2,
                child: RaisedButton(
                  color: Colors.indigo,
                  elevation: 10,
                  onPressed: _addTodoItem,
                  child: Center(
                    child: Text("Create", style: TextStyle(color: Colors.white),),
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


class AddToDo extends StatefulWidget {
  @override
  _AddToDoState createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.indigo,)
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: queryData.size.height/6,),
              Container(
                //height: queryData,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add To-Do Item", textAlign: TextAlign.left,style: GoogleFonts.mavenPro(fontSize: 35, color: Colors.black),),
                    SizedBox(height: 20,),
                    Text("Set A Practical Goal (30 Charachters)", textAlign: TextAlign.left,style: GoogleFonts.mavenPro(fontSize: 15, color: Colors.black),),
                    SizedBox(height: 20,),
                    Form(
                        //key: _formkey,
                        child: TextField()
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.indigo,elevation: 15,
                  child: Center(
                    child: Text("Add", style: TextStyle(color: Colors.white,fontSize: 18),)
                  ),
                ),
              ),
              SizedBox(height: queryData.size.height/15,),
              Container(
                height: queryData.size.height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/ToDo.jpg'),
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
