import 'package:flutter/material.dart';
import 'package:mindlift/widgets/gradient_text.dart';
import 'package:mindlift/widgets/menu_box.dart';

class MenuBoxWrapper extends StatelessWidget {
  final String topic;
  final List<String> menuItems;
  final List<IconData> icons;
  const MenuBoxWrapper(
      {Key? key,
      required this.topic,
      required this.menuItems,
      required this.icons})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(220, 2, 64, 16),
              Color.fromARGB(255, 21, 29, 69),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  type: Type.text,
                  text: topic,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 207, 207, 207),
                  ),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(224, 110, 172, 121),
                    Color.fromARGB(206, 118, 166, 211),
                  ]),
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuBox(
                      title: menuItems[0],
                      height: 80,
                      width: 80,
                      icon: icons[0],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MenuBox(
                      title: menuItems[1],
                      height: 80,
                      width: 80,
                      icon: icons[1],
                    ),
                  ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuBox(
                      title: menuItems[2],
                      height: 80,
                      width: 80,
                      icon: icons[2],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MenuBox(
                      height: 80,
                      width: 80,
                      title: menuItems[3],
                      icon: icons[3],
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
