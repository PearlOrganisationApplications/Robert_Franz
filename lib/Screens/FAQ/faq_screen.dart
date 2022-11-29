import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FAQ extends StatefulWidget {
   const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[

            Padding(
              padding: EdgeInsets.only(top:8.0,left: 8.0),
              child: Text("Produkte",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Card1(),
            Card2(),
            Card3(),
            Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text('Bestellung & Lieferung',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            Card4(),
            Card5(),
            Card6(),
            Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text("Robert Franz",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Card7(),// Card3(),
            Card8(),
          ],
        ),
      ),
    );
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

// class Card1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 150,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.orange,
//                   shape: BoxShape.rectangle,
//                 ),
//               ),
//             ),
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: const Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "ExpandablePanel",
//                     )),
//                 collapsed: const Text(
//                   loremIpsum,
//                   softWrap: true,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 expanded: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     for (var _ in Iterable.generate(5))
//                       const Padding(
//                           padding: EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             loremIpsum,
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           )),
//                   ],
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Expandable(
//                       collapsed: collapsed,
//                       expanded: expanded,
//                       theme: const ExpandableThemeData(crossFadePoint: 0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
      String paraText,
      String boldTitleText,
      String boldSubTitle,
    ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Handelt es sich um original Robert Franz Produkte?"),
                  expanded: buildExpanded1("Handelt es sich um original Robert Franz Produkte?\n",
                      "Bei allen angebotenen Robert Franz Produkten handelt es sich um originale Produkte von Robert Franz Firmen. Die produzierenden Firmen von Robert Franz lauten Robert Franz Naturversand GmbH und DOGenesis GmbH."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    //***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
      String paraText,
      String boldTitleText,
      String boldSubTitle,
    ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Wie ist die Dosierung der Produkte?"),
                  expanded: buildExpanded1("Wie ist die Dosierung der Produkte?\n",
                      "Die jeweilige Dosierung ist auf den Produkten selbst angegeben. Wir können Ihnen leider keine Dosierempfehlung geben, da wir Sie gesundheitsbezogen nicht beraten dürfen. "),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,
        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Warum sind Tier-Etiketten auf den Produken abgebildet?"),
                  expanded: buildExpanded1("Warum sind Tier-Etiketten auf den Produken abgebildet?\n",
                      "Robert Franz verkauft seit einiger Zeit seine Produkte nur noch für Tiere. Seine Begründung können Sie in folgendem Video erfahren: https://www.youtube.com/watch?v=keVcwne6CB0"),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card4 extends StatelessWidget {
  const Card4({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,
        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Wie lange ist die Lieferzeit?"),
                  expanded: buildExpanded1("Wie lange ist die Lieferzeit?\n",
                      "Wir bearbeiten Ihre Bestellung an Werktagen innerhalb von 24h. Produkte, die auf Lager sind, werden direkt an DHL übergeben. Produkte, die nicht auf Lager sind werden nach Wareneingang direkt an Sie versendet. Die Lieferzeit bis zur Zustellung von DHL beträgt meistens 24 - 48h. Bitte beachten Sie, dass im Dezember und Januar aufgrund des erhöhten Bestell-/Versandaufkommens längere Lieferzeiten entstehen können."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class Card5 extends StatelessWidget {
  const Card5({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,
        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Kann ich auch telefonisch bestellen?"),
                  expanded: buildExpanded1("Kann ich auch telefonisch bestellen?\n",
                      "Ja, eine telefonische Bestellung ist möglich. Unter 0711 365 369 49 können Sie eine telefonische Bestellung tätigen."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card6 extends StatelessWidget {
  const Card6({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,
        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Wird eine bestehende Kundennummer/-konto für eine Bestellung benötigt?"),
                  expanded: buildExpanded1("Wird eine bestehende Kundennummer/-konto für eine Bestellung benötigt?\n",
                      "Sie können alle Produkte auch ohne Kundennummer bestellen."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card7 extends StatelessWidget {
  const Card7({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,


        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,

            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Wer ist Robert Franz?"),
                  expanded: buildExpanded1("Wer ist Robert Franz?\n",
                      "Robert Franz ist ein Naturphilosoph und propagiert die natürliche Gesundheit/Heilung. Weitere Informationen über Robert Franz finden Sie hier."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card8 extends StatelessWidget {
  const Card8({super.key});

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

//***************************** Title Section ****************************/
    buildCollapsed1(String mainTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildCollapsed2() {
    //   return buildImg(Colors.lightGreenAccent, 150);
    // }

    buildCollapsedButton() {
      return Container();
    }

    buildExpanded1(String aboutTitle, String aboutSubTitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aboutTitle,style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  aboutSubTitle,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // buildExpanded2() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
    //           Expanded(child: buildImg(Colors.orange, 100)),
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           Expanded(child: buildImg(Colors.lightBlue, 100)),
    //           Expanded(child: buildImg(Colors.cyan, 100)),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    buildExpandedButton(
        String paraText,
        String boldTitleText,
        String boldSubTitle,
        ) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paraText,
              softWrap: true,
            ),
            RichText(
              text: TextSpan(
                  text: boldTitleText,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: boldSubTitle,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1("Kann ich eine persönliche Beratung von Robert Franz beanspruchen?"),
                  expanded: buildExpanded1("Kann ich eine persönliche Beratung von Robert Franz beanspruchen?\n",
                      "Robert Franz bietet aktuell keine persönliche Beratung an. Gesundheitsfragen können somit leider nicht beantwortet werden."),
                ),
                /************************** With Image *************************/
                // Expandable(
                //   collapsed: buildCollapsed2(),
                //   expanded: buildExpanded2(),
                // ),

                Expandable(
                  collapsed: buildCollapsedButton(),
                  expanded: buildExpandedButton(
                      "","",""),
                ),
                const Divider(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller =
                        ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? "Antwort ausblenden" : "Antwort lesen",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class Card3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildItem(String label) {
//       return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(label),
//       );
//     }
//
//     buildList() {
//       return Column(
//         children: <Widget>[
//           for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
//         ],
//       );
//     }
//
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToExpand: true,
//                   tapBodyToCollapse: true,
//                   hasIcon: false,
//                 ),
//                 header: Container(
//                   color: Colors.indigoAccent,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         ExpandableIcon(
//                           theme: const ExpandableThemeData(
//                             expandIcon: Icons.arrow_right,
//                             collapseIcon: Icons.arrow_drop_down,
//                             iconColor: Colors.white,
//                             iconSize: 28.0,
//                             iconRotationAngle: math.pi / 2,
//                             iconPadding: EdgeInsets.only(right: 5),
//                             hasIcon: false,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Items",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText1!
//                                 .copyWith(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 collapsed: Container(),
//                 expanded: buildList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
