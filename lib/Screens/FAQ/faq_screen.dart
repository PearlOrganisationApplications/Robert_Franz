

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "FAQ",
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
          initialUrl: "https://robert-franz-nr1.at/custom/index/sCustom/50",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}







// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class FAQ extends StatefulWidget {
//   const FAQ({Key? key}) : super(key: key);
//
//   @override
//   State<FAQ> createState() => _FAQState();
// }
//
// class _FAQState extends State<FAQ> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Frequently Asked Questions",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: ExpandableTheme(
//         data: const ExpandableThemeData(
//           iconColor: Colors.blue,
//           useInkWell: true,
//         ),
//         child: ListView(
//           physics: const BouncingScrollPhysics(),
//           children: const <Widget>[
//             Padding(
//               padding: EdgeInsets.only(top: 8.0, left: 8.0),
//               child: Text("Produkte",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//             Card1(),
//             Card2(),
//             Card3(),
//             Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: Text('Bestellung & Lieferung',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//             Card4(),
//             Card5(),
//             Card6(),
//             Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: Text(
//                 "Robert Franz",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Card7(), // Card3(),
//             Card8(),
//             Card9(),
//             Card10(),
//             Card11(),
//             Card12(),
//             Card13(),
//             Card14(),
//             Card15(),
//             Card16(),
//             Card17(),
//             Card18(),
//             Card19(),
//             Card20(),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// const loremIpsum =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
//
// // class Card1 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ExpandableNotifier(
// //         child: Padding(
// //       padding: const EdgeInsets.all(10),
// //       child: Card(
// //         clipBehavior: Clip.antiAlias,
// //         child: Column(
// //           children: <Widget>[
// //             SizedBox(
// //               height: 150,
// //               child: Container(
// //                 decoration: const BoxDecoration(
// //                   color: Colors.orange,
// //                   shape: BoxShape.rectangle,
// //                 ),
// //               ),
// //             ),
// //             ScrollOnExpand(
// //               scrollOnExpand: true,
// //               scrollOnCollapse: false,
// //               child: ExpandablePanel(
// //                 theme: const ExpandableThemeData(
// //                   headerAlignment: ExpandablePanelHeaderAlignment.center,
// //                   tapBodyToCollapse: true,
// //                 ),
// //                 header: const Padding(
// //                     padding: EdgeInsets.all(10),
// //                     child: Text(
// //                       "ExpandablePanel",
// //                     )),
// //                 collapsed: const Text(
// //                   loremIpsum,
// //                   softWrap: true,
// //                   maxLines: 2,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 expanded: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: <Widget>[
// //                     for (var _ in Iterable.generate(5))
// //                       const Padding(
// //                           padding: EdgeInsets.only(bottom: 10),
// //                           child: Text(
// //                             loremIpsum,
// //                             softWrap: true,
// //                             overflow: TextOverflow.fade,
// //                           )),
// //                   ],
// //                 ),
// //                 builder: (_, collapsed, expanded) {
// //                   return Padding(
// //                     padding:
// //                         const EdgeInsets.only(left: 10, right: 10, bottom: 10),
// //                     child: Expandable(
// //                       collapsed: collapsed,
// //                       expanded: expanded,
// //                       theme: const ExpandableThemeData(crossFadePoint: 0),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ));
// //   }
// // }
//
// class Card1 extends StatelessWidget {
//   const Card1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       "Handelt es sich um original Robert Franz Produkte?"),
//                   expanded: buildExpanded1(
//                       "Handelt es sich um original Robert Franz Produkte?\n",
//                       "Bei allen angebotenen Robert Franz Produkten handelt es sich um originale Produkte von Robert Franz Firmen. Die produzierenden Firmen von Robert Franz lauten Robert Franz Naturversand GmbH und DOGenesis GmbH."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card2 extends StatelessWidget {
//   const Card2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
//     //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed:
//                       buildCollapsed1("Wie ist die Dosierung der Produkte?"),
//                   expanded: buildExpanded1(
//                       "Wie ist die Dosierung der Produkte?\n",
//                       "Die jeweilige Dosierung ist auf den Produkten selbst angegeben. Wir k??nnen Ihnen leider keine Dosierempfehlung geben, da wir Sie gesundheitsbezogen nicht beraten d??rfen. "),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card3 extends StatelessWidget {
//   const Card3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       "Warum sind Tier-Etiketten auf den Produken abgebildet?"),
//                   expanded: buildExpanded1(
//                       "Warum sind Tier-Etiketten auf den Produken abgebildet?\n",
//                       "Robert Franz verkauft seit einiger Zeit seine Produkte nur noch f??r Tiere. Seine Begr??ndung k??nnen Sie in folgendem Video erfahren: https://www.youtube.com/watch?v=keVcwne6CB0"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card4 extends StatelessWidget {
//   const Card4({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1("Wie lange ist die Lieferzeit?"),
//                   expanded: buildExpanded1("Wie lange ist die Lieferzeit?\n",
//                       "Wir bearbeiten Ihre Bestellung an Werktagen innerhalb von 24h. Produkte, die auf Lager sind, werden direkt an DHL ??bergeben. Produkte, die nicht auf Lager sind werden nach Wareneingang direkt an Sie versendet. Die Lieferzeit bis zur Zustellung von DHL betr??gt meistens 24 - 48h. Bitte beachten Sie, dass im Dezember und Januar aufgrund des erh??hten Bestell-/Versandaufkommens l??ngere Lieferzeiten entstehen k??nnen."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card5 extends StatelessWidget {
//   const Card5({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed:
//                       buildCollapsed1("Kann ich auch telefonisch bestellen?"),
//                   expanded: buildExpanded1(
//                       "Kann ich auch telefonisch bestellen?\n",
//                       "Ja, eine telefonische Bestellung ist m??glich. Unter 0711 365 369 49 k??nnen Sie eine telefonische Bestellung t??tigen."),
//                 ),
//                 /************************** With Image *************************/
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card6 extends StatelessWidget {
//   const Card6({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       "Wird eine bestehende Kundennummer/-konto f??r eine Bestellung ben??tigt?"),
//                   expanded: buildExpanded1(
//                       "Wird eine bestehende Kundennummer/-konto f??r eine Bestellung ben??tigt?\n",
//                       "Sie k??nnen alle Produkte auch ohne Kundennummer bestellen."),
//                 ),
//                 /************************** With Image *************************/
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card7 extends StatelessWidget {
//   const Card7({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1("Wer ist Robert Franz?"),
//                   expanded: buildExpanded1("Wer ist Robert Franz?\n",
//                       "Robert Franz ist ein Naturphilosoph und propagiert die nat??rliche Gesundheit/Heilung. Weitere Informationen ??ber Robert Franz finden Sie hier."),
//                 ),
//                 /************************** With Image *************************/
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card8 extends StatelessWidget {
//   const Card8({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       "Kann ich eine pers??nliche Beratung von Robert Franz beanspruchen?"),
//                   expanded: buildExpanded1(
//                       "Kann ich eine pers??nliche Beratung von Robert Franz beanspruchen?\n",
//                       "Robert Franz bietet aktuell keine pers??nliche Beratung an. Gesundheitsfragen k??nnen somit leider nicht beantwortet werden."),
//                 ),
//                 /************************** With Image *************************/
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card9 extends StatelessWidget {
//   const Card9({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Ist eine telefonische Bestellung oder Beratung m??glich?"),
//                   expanded: buildExpanded1(
//                       "Ist eine telefonische Bestellung oder Beratung m??glich?\n",
//                       "Ja! Telefonische Beratungen und Bestellungen sind unter +43 664 12 10 084 m??glich. Wichtig: Eine Beratung ist uns nur soweit m??glich, wie es uns gesetzlich erlaubt ist! Wir d??rfen und k??nnen keine Heilversprechen oder Wirkungsversprechen geben! Auch d??rfen wir zu keinen gesundheitsbezogenen Themen beraten."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card10 extends StatelessWidget {
//   const Card10({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Gibt es die M??glichkeit eine Bestellung oder Anfrage per E-Mail zu senden?"),
//                   expanded: buildExpanded1(
//                       "Gibt es die M??glichkeit eine Bestellung oder Anfrage per E-Mail zu senden?\n",
//                       "Gerne k??nnen Sie uns Ihre Bestellung oder Anfrage unter office@robert-franz-nr1.at senden."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card11 extends StatelessWidget {
//   const Card11({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Unter welchen ??ffnungszeiten ist unser Robert Franz Shop in Gleisdorf erreichbar bzw. auch besuchbar?"),
//                   expanded: buildExpanded1(
//                       "Unter welchen ??ffnungszeiten ist unser Robert Franz Shop in Gleisdorf erreichbar bzw. auch besuchbar?\n",
//                       "Montag: 8:00 Uhr ??? 18:00 Uhr Dienstag: 8:00 Uhr ??? 18:00 Uhr Mittwoch: 8:00 Uhr ??? 18:00 Uhr Donnerstag: 8:00 Uhr - 13:00 Uhr Freitag: 8:00 Uhr ??? 18:00 Uhr Samstag: 8:00 Uhr ??? 13:00 Uhr An Sonn.- und Feiertagen geschlossen. Adresse: Robert Franz Shop Gleisdorf Schillerstra??e 13/4 8200 Gleisdorf ??sterreich"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card12 extends StatelessWidget {
//   const Card12({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Welche Zahlungsarten bietet unser Shop an?"),
//                   expanded: buildExpanded1(
//                       "Welche Zahlungsarten bietet unser Shop an?\n",
//                       "- Kauf auf Rechnung (f??r Kunden aus ??sterreich)  - PayPal  - Sofort ??berweisung (Klarna)"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card13 extends StatelessWidget {
//   const Card13({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(" Wie lange ist die Lieferzeit?"),
//                   expanded: buildExpanded1("Wie lange ist die Lieferzeit?\n",
//                       "- ??sterreich: 1-2 Werktage  - Deutschland/Italien: 2-3 Werktage Bei Sendungen in Europa bel??uft sich die Lieferzeit ca. auf 3-7 Tagen.  Bestellungen bis 13.00 Uhr werden noch am gleichen Tag versendet."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card14 extends StatelessWidget {
//   const Card14({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " In welche L??nder liefern wir und wie hoch sind die Lieferkosten? ??sterreich:"),
//                   expanded: buildExpanded1(
//                       "In welche L??nder liefern wir und wie hoch sind die Lieferkosten? ??sterreich:\n",
//                       "- Keine Versandkosten*  - Verpackungspauschale nur 2,90???**(siehe Beschreibung unten)  *Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 15kg Hundefutter Sack immer 2,90??? Versandkosten berechnet! Deutschland und Italien:  - 4,90 EURO Versand - Verpackungspauschale nur 2,90???**  - Innerhalb Deutschland Versandkostenfrei* ab 90,00 EURO - Innerhalb Italien Versandkostenfrei* ab 139,00 EURO *Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 5kg und 15kg Hundefutter Sack immer 6,90??? Versandkosten berechnet! Versandkosten Zone 2: Kroatien, Slowenien, Ungarn, Belgien, Tschechische Republik, Luxemburg, Niederlande, Slowakei  - 7,90 EURO Versand - Versandkostenfrei ab 139,00??? - Verpackungspauschale nur 2,90???** *Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 5kg und 15kg Hundefutter Sack immer 7,90??? Versandkosten berechnet! Versandkosten Zone 3: D??nemark, Finnland, Frankreich, Polen, Schweden  - 11,90 EURO Versand - Versandkostenfrei ab 199,00??? - Verpackungspauschale nur 2,90???** *Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 5kg und 15kg Hundefutter Sack immer 11,90??? Versandkosten berechnet! Versandkosten Zone 4: Spanien, Estland, Griechenland, Irland, Lettland, Litauen, Malta, Portugal, Zypern - 14,90 EURO Versand - Versandkostenfrei ab 219,00??? - Verpackungspauschale nur 2,90???** *Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 5kg und 15kg Hundefutter Sack immer 14,90??? Versandkosten berechnet! Innerhalb der Schweiz, England und Liechtenstein:  - 25,90 EURO Versand  - Verpackungspauschale nur 2,90???** - Versandkostenfrei* ab 499,00 EURO*Ausgenommen Hundefutter! Sollte Ihre Bestellung Hundefutter enthalten, werden pro 5kg und15kg Hundefutter Sack immer 14,90??? Versandkosten berechnet! **Warum eine Verpackungspauschale von 2,90???? Unabh??ngig von der Menge der bestellten Artikel. Aufwandspauschale f??r die Verpackung: Karton, Klebematerial, Luftpolsterfolie, F??llpapier, unser nachhaltiges F??llmaterial aus Maisst??rke oder Wellpappe zum Schutz des MIRON-Violett-Glases, Adressaufkleber usw. Mindermengenzuschlag von 3,80 EURO bei einer Bestellung unter 4,60 EURO VERSAND ERFOLGT AUS ??STERREICH! Es wird kein kostenloser R??ckversand angeboten. Satz.- und Tippfehler vorbehalten! "),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card15 extends StatelessWidget {
//   const Card15({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Sind unsere Robert Franz Produkte versiegelt?"),
//                   expanded: buildExpanded1(
//                       "Sind unsere Robert Franz Produkte versiegelt?\n",
//                       "Ja, unsere Produkte werden mit einem Siegel von unserem Shop ausgeliefert!"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card16 extends StatelessWidget {
//   const Card16({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Ist eine R??ckgabe der Produkte m??glich?"),
//                   expanded: buildExpanded1(
//                       "Ist eine R??ckgabe der Produkte m??glich?\n",
//                       "Eine R??ckgabe ist m??glich. Innerhalb der n??chsten 14 Tage nach Erhalt der Bestellung. Wichtig: Bei der R??ckgabe muss das Produkt unge??ffnet sein und das Siegel darf nicht durchtrennt sein. Zu beachten: Wir bieten keinen kostenlosen R??ckversand an. Die Kosten des R??ckversand werden vom Kunden getragen. (Nat??rlich ausgenommen, Sie haben ein falsches oder nicht bestelltes Produkt erhalten)"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card17 extends StatelessWidget {
//   const Card17({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Kann man Robert Franz pers??nlich treffen?"),
//                   expanded: buildExpanded1(
//                       "Kann man Robert Franz pers??nlich treffen?\n",
//                       "Man kann Robert Franz pers??nlich treffen, aber leider nur bei Vortr??gen. F??r Informationen ??ber Vortr??ge, kontaktieren Sie uns gerne pers??nlich."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card18 extends StatelessWidget {
//   const Card18({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed:
//                       buildCollapsed1(" Wie ist die Dosierung der Produkte?"),
//                   expanded: buildExpanded1(
//                       "Wie ist die Dosierung der Produkte?\n",
//                       "Die Dosierung steh auf das jeweilige Produkt geschrieben. Auch in den Videos von Robert Franz finden Sie Empfehlungen, wie es Robert Franz pers??nlich f??r sich dosieren w??rde. Wir pers??nlich d??rfen Ihnen leider keine Dosierungsempfehlungen geben, da wir gesundheitsbezogen nicht beraten d??rfen."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card19 extends StatelessWidget {
//   const Card19({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Was k??nnen Sie tun, sollten Sie keine Antwort auf meine Frage gefunden haben?"),
//                   expanded: buildExpanded1(
//                       "Was k??nnen Sie tun, sollten Sie keine Antwort auf meine Frage gefunden haben?\n",
//                       "Gerne k??nnen Sie uns auch telefonisch unter +43 664 12 10 084, per E-Mail unter office@robert-franz-nr1.at erreichen. Oder und eine Frage in der App, im Chat stellen."),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Card20 extends StatelessWidget {
//   const Card20({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }
//
// //***************************** Title Section ****************************/
//     buildCollapsed1(String mainTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   mainTitle,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildCollapsed2() {
//     //   return buildImg(Colors.lightGreenAccent, 150);
//     // }
//
//     buildCollapsedButton() {
//       return Container();
//     }
//
//     buildExpanded1(String aboutTitle, String aboutSubTitle) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   aboutTitle,
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   aboutSubTitle,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     // buildExpanded2() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: <Widget>[
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//     //           Expanded(child: buildImg(Colors.orange, 100)),
//     //         ],
//     //       ),
//     //       Row(
//     //         children: <Widget>[
//     //           Expanded(child: buildImg(Colors.lightBlue, 100)),
//     //           Expanded(child: buildImg(Colors.cyan, 100)),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//
//     buildExpandedButton(
//       String paraText,
//       String boldTitleText,
//       String boldSubTitle,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               paraText,
//               softWrap: true,
//             ),
//             RichText(
//               text: TextSpan(
//                   text: boldTitleText,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: boldSubTitle,
//                         style: const TextStyle(fontWeight: FontWeight.normal))
//                   ]),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         child: ScrollOnExpand(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed1(
//                       " Wo finden Sie unsere Allgemeinen Gesch??ftsbedingungen (AGB???s)?"),
//                   expanded: buildExpanded1(
//                       "Wo finden Sie unsere Allgemeinen Gesch??ftsbedingungen (AGB???s)?\n",
//                       "Unsere AGB???s finden Sie im Button des Onlineshops, wenn Sie ganz nach unten scrollen unter dem"),
//                 ),
//                 /************************** With Image *************************/
//                 // Expandable(
//                 //   collapsed: buildCollapsed2(),
//                 //   expanded: buildExpanded2(),
//                 // ),
//
//                 Expandable(
//                   collapsed: buildCollapsedButton(),
//                   expanded: buildExpandedButton("", "", ""),
//                 ),
//                 const Divider(height: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var controller =
//                             ExpandableController.of(context, required: true)!;
//                         return TextButton(
//                           child: Text(
//                             controller.expanded
//                                 ? "Antwort ausblenden"
//                                 : "Antwort lesen",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .button!
//                                 .copyWith(color: Colors.deepPurple),
//                           ),
//                           onPressed: () {
//                             controller.toggle();
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
