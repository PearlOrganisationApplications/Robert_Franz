import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          initialUrl: "https://robert-franz-nr1.at/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
