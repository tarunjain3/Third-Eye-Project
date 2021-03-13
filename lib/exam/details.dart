import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExamDetails extends StatefulWidget {
  final File imageUrl;

  const ExamDetails({Key key, this.imageUrl}) : super(key: key);
  @override
  _ExamDetailsState createState() => _ExamDetailsState();
}

class _ExamDetailsState extends State<ExamDetails> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var profileImage;
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    Future getImage(BuildContext context) async {
      File _image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = _image;
        print("_image: $_image");
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExamDetails(
                    imageUrl: _image,
                  )));
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: cHeight * 0.25,
                          width: cWidth,
                          color: Colors.blue[100],
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: widget.imageUrl == null
                                    ? Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                        size: cHeight * 0.15,
                                      )
                                    : Image.file(
                                        widget.imageUrl,
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      top: cHeight * 0.02,
                                    ),
                                    child: //editProfile
                                        ElevatedButton(
                                      onPressed: () => getImage(context),
                                      child: Text(
                                        "Add Photo",
                                      ),
                                    )
                                    //: Text(""),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: cWidth * 0.05,
                              right: cWidth * 0.05,
                              top: cHeight * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: fNameController,
                                  decoration: InputDecoration(
                                    labelText: "First Name*",
                                    border: UnderlineInputBorder(),
                                  ),
                                  // validator: (value) => validateName(
                                  //   value,
                                  //   "First",
                                  // ),
                                ),
                              ),
                              Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  controller: lNameController,
                                  decoration: InputDecoration(
                                    labelText: "Last Name*",
                                    border: UnderlineInputBorder(),
                                  ),
                                  // validator: (value) => validateName(
                                  //   value,
                                  //   "Last",
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: cWidth * 0.05,
                              right: cWidth * 0.05,
                              top: cHeight * 0.01),
                          child: TextFormField(
                            maxLength: 10,
                            controller: phoneController,
                            decoration: InputDecoration(
                              counterText: "",
                              prefix: Text("(+91) ",
                                  style: TextStyle(color: Colors.black)),
                              labelText: "Phone Number*",
                              border: UnderlineInputBorder(),
                            ),
                            // validator: (value) => phoneNumberValid(
                            //   value,
                            // ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: cWidth * 0.05),
                              child: Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  controller: rollNoController,
                                  decoration: InputDecoration(
                                    labelText: "Roll Number*",
                                    border: UnderlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: cWidth * 0.05),
                              child: Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  controller: classController,
                                  decoration: InputDecoration(
                                    labelText: "Class*",
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: cWidth * 0.05),
                              child: Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  controller: schoolController,
                                  decoration: InputDecoration(
                                    labelText: "School/College*",
                                    border: UnderlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: cWidth * 0.05),
                              child: Container(
                                width: cWidth * 0.4,
                                child: TextFormField(
                                  controller: subjectController,
                                  decoration: InputDecoration(
                                    labelText: "Subject*",
                                    border: UnderlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: PhysicalModel(
                          color: Colors.blue,
                          child: MaterialButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                content: Text(
                                    'You will be redirected to Exam Portal soon'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: Text(
                              "Start Exam",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
