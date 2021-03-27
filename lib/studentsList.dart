import 'package:flutter/material.dart';
import 'package:thirdeye/api/apiStudentsDetailList.dart';

class StudentsList extends StatefulWidget {
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  List<String> students = [
    "Tarun jain",
    "Pratham Goyal",
    "Rajat Mittal",
    "Etendra Verma",
    "John Doe"
  ];
  List<String> phoneNumbers = [
    "+91 7009950116",
    "+91 9988034040",
    "+91 9041950023",
    "+91 8601062439",
    "+91 9999999999"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Class Mates")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: postStudentDetail(context),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(snapshot.data[index]["username"]),
                          subtitle: Text(snapshot.data[index]["phone"])),
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
