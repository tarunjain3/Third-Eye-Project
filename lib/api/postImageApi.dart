import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:thirdeye/exam/webView.dart';
import 'package:thirdeye/global/alert.dart';
import 'package:thirdeye/global/var.dart';

Future postImage(BuildContext context, File img, String name) async {
  String path = "/api/img";
  final imageBytes = img.readAsBytesSync();
  String base64Image = base64Encode(imageBytes);
  print("################ $base64Image");
  Map<String, String> body = {
    "username": "$name",
    "img":
        "data:image/jpeg;base64,$base64Image"
  };
  print(body);

  var url = Uri(
    host: host,
    scheme: scheme,
    path: path,
  );
  print(
    json.encode(body),
  );

  print(url);
  var response = await http.post(
    Uri(
      host: host,
      scheme: scheme,
      path: path,
    ),
    body: body,
  );
  var data = json.decode(response.body);
  print(data);
  if (response.statusCode == 200) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExamWebView()));
  } else {
    return showMyDialog(context, "verfication failed", data["detection"]);
  }
}
