import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:thirdeye/exam/webView.dart';
import 'package:thirdeye/global/alert.dart';

Future postImage(BuildContext context, File img, String name) async {
  List<int> imageBytes = img.readAsBytesSync();
  print(imageBytes);
  String base64Image = base64Encode(imageBytes);
  Map<String, String> body = {"img": "", "name": "$base64Image"};
  var response = await http.post(
    Uri(
      host: "",
      scheme: "",
      port: 123,
      path: "",
    ),
    body: json.encode(body),
  );
var data = json.decode(response.body);
  if (response.statusCode == 200) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExamWebView()));
  }
  else {
    return showMyDialog(context , "verfication failed" , data[""]);
  }
}
