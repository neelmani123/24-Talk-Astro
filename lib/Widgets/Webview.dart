import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewer extends StatelessWidget {

  final String appbarText;
  final String webUrl;

  WebViewer({this.appbarText, @required this.webUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarText),
      ),
      body: WebView(initialUrl: "$webUrl",)
    );
  }
}
