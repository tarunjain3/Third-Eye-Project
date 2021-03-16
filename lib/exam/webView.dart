import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class ExamWebView extends StatefulWidget {
  final PageController controller;
  final int destination;

  const ExamWebView({Key key, this.controller, Key index, this.destination})
      : super(key: key);
  @override
  _ExamWebViewState createState() => _ExamWebViewState();
}

class _ExamWebViewState extends State<ExamWebView> {
  File _image;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: '_Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Future getImage(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        getImage(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Exam"),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                initialUrl:
                    "https://therealtechwiz.github.io/project/facerecognition/",
                gestureRecognizers: Set()
                  ..add(
                    Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer(),
                    ),
                  ),
                // Factory<VerticalDragGestureRecognizer>(
                //  () => VerticalDragGestureRecognizer()..onUpdate = (_) {},
                // ),
                initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy
                    .require_user_action_for_all_media_types,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                javascriptChannels: <JavascriptChannel>[
                  _toasterJavascriptChannel(context),
                ].toSet(),
              ),
            )
          ],
        ));
  }
}
