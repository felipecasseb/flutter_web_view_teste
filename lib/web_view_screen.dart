import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://www.absystecnologia.com.br/',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish){
                setState(() {
                  loading = false;
                });
              },
            ),
            loading ? Center(child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.grey,
            ),)
                : Stack()
          ],
        ),
      ),
    );
  }
}
