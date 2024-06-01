import 'package:flutter/material.dart';
import 'package:mortivate/widgets/gradient_text.dart';

class MenuBox extends StatelessWidget {
  final double width;
  final double height;
  final BoxDecoration decoration;
  final String title;
  final IconData icon;

  const MenuBox({
    Key? key,
    this.width = 25,
    this.height = 10,
    required this.icon,
    required this.title,
    this.decoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 17, 84, 8),
            Color.fromARGB(232, 21, 48, 80),
          ]),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 0, 26, 6),
          spreadRadius: 0.5,
          blurRadius: 2,
          offset: Offset(0, 1),
        )
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: height,
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 189, 222, 184),
                          fontSize: 12)),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(70, 120, 139, 155),
                      Color.fromARGB(211, 120, 121, 120)
                    ]),
                    type: Type.icon,
                    icon: Icon(icon,
                        color: const Color.fromARGB(255, 125, 155, 120),
                        size: 50)))
          ],
        ));
  }
}
