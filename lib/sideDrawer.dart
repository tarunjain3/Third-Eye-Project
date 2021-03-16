import 'package:flutter/material.dart';
import 'package:thirdeye/exam/exams.dart';
import 'package:thirdeye/loginScreen.dart';
import 'package:thirdeye/studentsList.dart';
import 'package:thirdeye/timeTable.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    var cHeight = MediaQuery.of(context).size.height;
    var cWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: cHeight * 0.22,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: cWidth,
                  decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: cHeight * 0.03,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.navigate_before,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Padding(
                          padding: EdgeInsets.only(left: cWidth * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                radius: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: cWidth * 0.04),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "User Name",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Text("{userPhoneNum}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: cHeight * 0.01,
              left: cWidth * 0.05,
              right: cWidth * 0.05,
            ),
            child: Divider(
              thickness: 2,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: cWidth * 0.1),
                  leading: Icon(
                    Icons.group,
                    color: Color(0xFF398AE5),
                  ),
                  title: Text("Exams"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: cWidth * 0.1),
                  leading: Icon(
                    Icons.format_list_bulleted,
                    color: Color(0xFF398AE5),
                  ),
                  title: Text("Attendence"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: cWidth * 0.1),
                  leading: Icon(
                    Icons.people,
                    color: Color(0xFF398AE5),
                  ),
                  title: Text("Class Mate"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentsList()));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: cWidth * 0.1),
                  leading: Icon(
                    Icons.schedule,
                    color: Color(0xFF398AE5),
                  ),
                  title: Text("Time Table"),
                  onTap: () async {
                     Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimeTable()));
                  },
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.only(left: cWidth * 0.1),
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () async {
                    return Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
