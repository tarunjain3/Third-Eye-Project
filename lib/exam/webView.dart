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
        print("_image : $_image");
      } else {
        print('No image selected.');
      }
    });
    return _image;
  }

  @override
  void initState() {
      Future.delayed(const Duration(milliseconds: 8000), () {
        getImage(context);
         Future.delayed(const Duration(milliseconds: 5000), () {
        getImage(context);
        Future.delayed(const Duration(milliseconds: 5000), () {
        getImage(context);
        Future.delayed(const Duration(milliseconds: 5000), () {
        getImage(context);
        
      });
        
      });
      });
      });
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
                    "https://docs.google.com/forms/d/e/1FAIpQLSdZPT0G3bhosB8q0NcMqXCMUPDFGR9D6RcUWmnB-qTwwb2f4g/viewform",
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
