import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:thirdeye/global/var.dart';

Future postStatusChangeApi(
    BuildContext context, String userName, int verifyCount) async {
  String path = "/api/statusChange";
  Map<String, dynamic> body;
  if (verifyCount == 3) {
    print("############################### $verifyCount");
    body = {
      "username": "$userName",
      "valid": "true",
    };
  } else {
    body = {
      "username": "$userName",
      "valid": "false",
    };
  }
  print(body);
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
    body: body,
  );
  var data = json.decode(response.body);
  print(data);
  return;
}
