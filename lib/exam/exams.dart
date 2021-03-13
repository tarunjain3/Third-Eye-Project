import 'package:flutter/material.dart';

class ExamsList extends StatefulWidget {
  @override
  _ExamsListState createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  List<String> subjects = ["Science", "Hindi", "Maths", "Englist", "Computer"];
  List<String> timings = ["10:00-11:00 am","11:00-12:00 pm","12:00-01:00 pm","01:00-02:00 9m","02:00-03:00 pm"];

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
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Subject ${subjects[index]}"),
                    subtitle: Text("${timings[index]}"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
