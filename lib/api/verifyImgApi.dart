import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thirdeye/api/postStatusChangeApi.dart';
import 'dart:async';
import 'package:thirdeye/global/var.dart';

Future verifingImage(BuildContext context, File img, String name) async {
  String path = "/api/img";
  final imageBytes = img.readAsBytesSync();
  String base64Image = base64Encode(imageBytes);
  print("################ $img");
  Map<String, String> body = {
    "username": "$name",
    "img": "data:image/jpeg;base64,$base64Image"
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
  print("just hit the api");
  print(response.body);
  var data = json.decode(response.body);
  print(data);
  if (response.statusCode == 200) {
  verfiedImgcount = verfiedImgcount + 1;
  print("xcbvbc verfiedImgcount: $verfiedImgcount");
  if (cameraCalled == 3) {
    await postStatusChangeApi(context, name, verfiedImgcount);
  }
  return;
  }
  return ;
}
