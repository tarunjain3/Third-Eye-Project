import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirdeye/exam/details.dart';
import 'package:thirdeye/sideDrawer.dart';

class ExamsList extends StatefulWidget {
  final File imageUrl;

  const ExamsList({Key key, this.imageUrl}) : super(key: key);
  @override
  _ExamsListState createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  String name = "User Name";
  List<String> subjects = ["Science", "Hindi", "Maths", "Englist", "Computer"];
  List<String> timings = [
    "10:00-11:00 am",
    "11:00-12:00 pm",
    "12:00-01:00 pm",
    "01:00-02:00 9m",
    "02:00-03:00 pm"
  ];
  getName(BuildContext context)async{
     SharedPreferences pref = await SharedPreferences.getInstance();
        name =   pref.getString("name");
        setState(() {
          name = name;
        });
        return name;
  }
  @override
  void initState() {
    getName(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: SideDrawer(name:name),
      appBar: AppBar(
       
        title: Center(child: Text("Exams")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExamDetails()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("Subject ${subjects[index]}"),
                      subtitle: Text("${timings[index]}"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
