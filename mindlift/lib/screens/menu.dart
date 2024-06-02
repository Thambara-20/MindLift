import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mindlift/widgets/menu_box_wrapper.dart';
import 'package:mindlift/widgets/special_quote.dart';
import 'package:mindlift/widgets/styled_button.dart';

class Menu {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: null,
      backgroundColor: CupertinoColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      builder: (BuildContext context) {
        return Content(context);
      },
    );
  }

  // ignore: non_constant_identifier_names
  static Widget Content(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 2, 39, 8),
                  Color.fromARGB(255, 0, 29, 57),
                ],
              ),
            ),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: QuoteBodyContainer(
                      quote: 'Doubt kills more dreams than failure ever will.',
                      author: 'Suzy Kassem',
                      height: '50',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MenuBoxWrapper(topic: 'Main menu', menuItems: [
                    'General',
                    'My Quotes',
                    'My Favorites',
                    'Exercises plus'
                  ], icons: [
                    Icons.book,
                    Icons.note,
                    Icons.favorite,
                    Icons.handshake
                  ]),
                  MenuBoxWrapper(topic: 'For Personal Growth', menuItems: [
                    'Upgrade',
                    'Boost your mind',
                    'Level up',
                    'Mortivation Plus'
                  ], icons: [
                    Icons.arrow_outward,
                    Icons.mediation,
                    Icons.show_chart_outlined,
                    Icons.medical_information
                  ]),
                  // MenuBoxWrapper(topic: 'For Personal Growth', menuItems: [
                  //   'Upgrade',
                  //   'Boost your mind',
                  //   'Level up',
                  //   'MindLift'
                  // ], icons: [
                  //   Icons.arrow_outward,
                  //   Icons.mediation,
                  //   Icons.show_chart_outlined,
                  //   Icons.medical_information
                  // ]),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: .0,
            child: StyledElevatedButton(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
