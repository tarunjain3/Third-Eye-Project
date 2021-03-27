import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:thirdeye/global/alert.dart';
import 'package:thirdeye/global/var.dart';

Future postStudentDetail(BuildContext context) async {
  String path = "/api/allUsers";

  var url = Uri(
    host: host,
    scheme: scheme,
    path: path,
  );
  print(url);
  var response = await http.post(
    Uri(
      host: host,
      scheme: scheme,
      path: path,
    ),
  );
  var data = json.decode(response.body);
  print(data);
  if (response.statusCode == 200) {
    return data["users"];
  } else {
    return showMyDialog(context, "Unexpected Error", "please try again later");
  }
}
