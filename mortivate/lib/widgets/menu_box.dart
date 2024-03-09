import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final double width;
  final double height;
  final BoxDecoration decoration;
  final String title;

  const MenuBox({
    Key? key,
    this.width = 25,
    this.height = 10,
    required this.title,
    this.decoration = const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 7, 81, 1),
              Color.fromARGB(255, 0, 42, 9),
            ]),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 1),
          )
        ],
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
          left: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
          right: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
          bottom: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        )),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: height,
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Color.fromARGB(234, 135, 195, 135), fontSize: 12)),
            )
          ],
        ));
  }
}
