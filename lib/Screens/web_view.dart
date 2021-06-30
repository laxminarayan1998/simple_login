import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewWebView extends StatelessWidget {
  const NewWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HobList'),
      ),
      body: const WebView(
        initialUrl: 'https://hoblist.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
