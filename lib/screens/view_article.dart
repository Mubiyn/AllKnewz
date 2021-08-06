import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("All "),
            Text(
              "Newz",
              style: TextStyle(color: Colors.orange),
            )
          ],
        ),
        brightness: Brightness.light,
        elevation: 1.0,
        actions: [
          Opacity(
            opacity: 0.6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              // _loading == false
              //     ? Center(
              //         child: Container(
              //           child: CircularProgressIndicator(),
              //         ),
              //       )
              //     :
              WebView(
            onPageStarted: (value) {
              print("this is page statrted" + value);
            },
            onPageFinished: (value) => {print("this is page finished" + value)},
            initialUrl: widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          )),
    );
  }
}
