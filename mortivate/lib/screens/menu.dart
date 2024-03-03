import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mortivate/widgets/special_quote.dart';

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
        return _Content(context);
      },
    );
  }

  // ignore: non_constant_identifier_names
  static Widget _Content(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                QuoteBodyContainer(quote: 'quote', author: 'author', height: '50',),
              ],
            ),
          )),
    );
  }
}
