import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class storeLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Store Locator",
            style: TextStyle(color: Colors.white),
          )),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://sabti-store-locator.herokuapp.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
