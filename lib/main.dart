import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:robert_franz/Screens/Youtube/youtube_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Screens/Cart Screen/cart_page.dart';
import 'Screens/Chat Tawk/chat_tawk.dart';
import 'Screens/FAQ/faq_screen.dart';

// Step 1: Define a Callback.
typedef void IntCallback(int id);

void main() {
WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
// enum NetworkStatus { online, offline }

// void main() async {
//   var connectedornot = NetworkStatus.offline;
//   try {
//     final result = await InternetAddress.lookup('example.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       connectedornot = NetworkStatus.online;
//     } else {
//       connectedornot = NetworkStatus.offline;
//     }
//   } on SocketException catch (_) {
//     connectedornot = NetworkStatus.offline;
//   }
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp(connectedornot: connectedornot));
// }

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Robert Franz',
      home: MyHomePage(title: 'Robert Franz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _widgetOptions;
  int badge = 10;
  int _selectedIndex = 0;
  late final IntCallback onSonChanged;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      const WebViewScreen(),
      const FAQ(),
      const CartScreen(),
      const ChatTawk(),
      const YoutubeHomeScreen(),
      InkWell(
          onTap: () {
            Get.to(const MyHomePage(title: ""));
          },
          child: const Text("")),
    ];
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                offset: Offset(1.0, 0.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    onPressed: () {},

                    iconActiveColor: Colors.black,
                    iconSize: 20,
                    backgroundColor: Colors.purpleAccent.withOpacity(.5),
                    icon: FontAwesomeIcons.newspaper,
                    // text: 'Home',
                  ),
                  GButton(
                    iconActiveColor: Colors.redAccent,
                    iconSize: 20,
                    backgroundColor: Colors.purpleAccent.withOpacity(.5),
                    icon: LineIcons.question,
                    // text: 'Whatsapp',
                  ),
                  GButton(
                    iconSize: 20,
                    iconActiveColor: Colors.black,
                    backgroundColor: Colors.purpleAccent.withOpacity(.5),
                    icon: FontAwesomeIcons.cartShopping,
                    // text: 'Shop Cart',
                  ),
                  GButton(
                    iconSize: 20,
                    iconActiveColor: Colors.blue,
                    backgroundColor: Colors.purpleAccent.withOpacity(.5),
                    icon: FontAwesomeIcons.message,
                    // text: 'Youtube',
                  ),
                  GButton(
                    iconSize: 20,
                    iconActiveColor: Colors.red,
                    backgroundColor: Colors.purpleAccent.withOpacity(.5),
                    icon: FontAwesomeIcons.youtube,
                    // text: 'Youtube',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> _goBack(BuildContext context) async {
  //   if (await _controller!.canGoBack()) {
  //     _controller!.goBack();
  //     return Future.value(false);
  //   } else {
  //     showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text(
  //           "Are You Sure! You Want To Quit",
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text("Cancel"),
  //           ),
  //           ElevatedButton(
  //             style: ButtonStyle(
  //                 backgroundColor:
  //                     MaterialStateProperty.all<Color>(Colors.red)),
  //             onPressed: () {
  //               SystemNavigator.pop();
  //             },
  //             child: const Text("Yes"),
  //           ),
  //         ],
  //       ),
  //     );
  //     return Future.value(true);
  //   }
  // }
}

// BottomNavigationBar(
// items: const <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: Icon(FontAwesomeIcons.newspaper),
// label: 'Calls',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.camera),
// label: 'Camera',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.chat),
// label: 'Chats',
// ),
// // BottomNavigationBarItem(
// //   icon: Icon(Icons.chat),
// //   label: 'Chats',
// // ),
// ],
// currentIndex: _selectedIndex,
// onTap: (index) {
// setState(() {
// _selectedIndex = index;
// });
// },
// )
class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _webViewController;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith("mailto:") ||
                  request.url.startsWith("tel:") ||
                  request.url.startsWith("whatsapp:")) {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              } else {
                return NavigationDecision.navigate;
              }
            },
            onWebViewCreated: (WebViewController webViewController) async {
              _controllerCompleter.future.then((value) => _controller = value);
              _controllerCompleter.complete(webViewController);
              _webViewController = webViewController;
              _webViewController?.loadUrl(
                  "https://robert-franz-nr1.at/blog/index/sCategory/70");
              // String fileContent = await rootBundle.loadString('assets/index.html');
              // _webViewController?.loadUrl(Uri.dataFromString(fileContent, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
            },
            javascriptChannels: <JavascriptChannel>{
              JavascriptChannel(
                name: 'messageHandler',
                onMessageReceived: (JavascriptMessage message) {
                  print("message from the web view=\"${message.message}\"");
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 0.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: -0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              message.message,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page Finished Loading:$url');
              if (url.contains('/final response.html')) {
                _controller?.evaluateJavascript(
                    "(function(){Notification.postMessage(window.document.body.outerHTML)})();");
              }
            },
            initialUrl: "https://robert-franz-nr1.at/special-offers",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _controller!.canGoBack()) {
      _controller!.goBack();
      return Future.value(false);
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Are You Sure! You Want To Quit",
            style: TextStyle(fontSize: 15),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
      return Future.value(true);
    }
  }

  void _launchURL(String url) async {
    if (await launch(url)) throw "Could Not launch $url";
  }
}
