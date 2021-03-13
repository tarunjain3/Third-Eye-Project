import 'package:flutter/material.dart';
class StudentsList extends StatefulWidget {
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  List<String> subjects = ["Science", "Hindi", "Maths", "Englist", "Computer"];
  List<String> timings = ["10:00-11:00 am","11:00-12:00 pm","12:00-01:00 pm","01:00-02:00 9m","02:00-03:00 pm"];
  String odd = " 98956545665";
  String even= "45454654564"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Exams")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Subject ${index +1}"),
                    subtitle: index % 2 == 0
                   ? Text("$even")
                   :Text("$odd"),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
