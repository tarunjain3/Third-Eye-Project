import 'package:flutter/material.dart';
class StudentsList extends StatefulWidget {
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  List<String> students = ["Tarun jain", "Pratham Goyal", "Rajat Mittal", "Etendra Verma" ,"John Doe"];
  List<String> phoneNumbers = ["+91 7009950116" , "+91 9988034040" , "+91 9041950023", "+91 8601062439" , "+91 9999999999"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Class Mates")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(students[index]),
                    subtitle: Text(phoneNumbers[index])              
                  ),
                );
              }),
        ),
      ),
    );
  }
}
