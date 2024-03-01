import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 252, 252, 252),
      child: Column(
        children: [
          const Text(
            'Home',
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 4,
                  bottom: 4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                    onPressed: () {},
                    child: const Icon(Icons.settings,
                        color: Color.fromARGB(255, 92, 92, 92)),
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      onPressed: () {},
                      child: const Text('Menu')),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
