import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          // navigationDelegate: (NavigationRequest request) {
          //   if (request.url.startsWith("mailto:") ||
          //       request.url.startsWith("tel:") ||
          //       request.url.startsWith("whatsapp:")) {
          //     _launchURL(request.url);
          //     return NavigationDecision.prevent;
          //   } else {
          //     return NavigationDecision.navigate;
          //   }
          // },
          onWebViewCreated: (WebViewController webViewController) {
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(webViewController);
          },
          initialUrl: "https://robert-franz-nr1.at/custom/index/sCustom/51",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
