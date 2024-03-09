import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mortivate/widgets/menu_box.dart';
import 'package:mortivate/widgets/special_quote.dart';
import 'package:mortivate/widgets/title.dart';

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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 4, 22, 7),
                Color.fromARGB(255, 4, 21, 38),
              ],
            ),
          ),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: QuoteBodyContainer(
                    quote: 'quote',
                    author: 'author',
                    height: '50',
                  ),
                ),
                StyledTitle(title: 'Menu'),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuBox(
                              title: 'General',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MenuBox(
                              title: 'My Quotes',
                              height: 80,
                              width: 80,
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuBox(
                              title: 'My Favorites',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MenuBox(
                              height: 80,
                              width: 80,
                              title: 'Exercises plus',
                            ),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
