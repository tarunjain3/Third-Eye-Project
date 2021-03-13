import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<String> weekDays = ["Monday", "Tuesday", "Wednessday" ,"Thursday" ,"Friday"];
  List<String> subjects = ["Science" , "Hindi" ,"Maths" , "Englist" , "Computer"];
  List<String> timings = ["10:00-11:00 am","11:00-12:00 pm","12:00-01:00 pm","01:00-02:00 9m","02:00-03:00 pm"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Timetable")),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: weekDays.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.transparent,
                    child: ExpansionTile(
                      title: Text(
                        "${weekDays[index]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: List.generate(
                        weekDays.length,
                        (index) {
                          return Column(
                            children: <Widget>[
                              index == 0
                                  ? ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            " Period",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Time In",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Offstage(),
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(subjects[index]),
                                    Text(timings[index]),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ));
              }),
        ));
  }
}
