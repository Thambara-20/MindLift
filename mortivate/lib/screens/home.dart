import 'package:flutter/material.dart';
import 'package:mortivate/screens/menu.dart';
import 'package:mortivate/widgets/next_button.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 18, 67, 165),
              Color.fromARGB(255, 5, 104, 12),
            ],
          ),
        ),
        child: Column(
          children: [
            const Text('Home'),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    // Component for middle screen daily quotes image container
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: const MiddlePageComponent(),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.settings,
                          color: Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StyledElevatedButton(
                          onPressed: () {
                            Menu.show(context);
                          },
                          height: 40,
                          child: const Text('Menu',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(202, 255, 255, 255))),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiddlePageComponent extends StatelessWidget {
  const MiddlePageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // Replace with your widget for the daily quotes image container
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: const Color.fromARGB(
              138, 255, 255, 255), // Replace with your color or decoration
          image: const DecorationImage(
            image:
                AssetImage('assets/yoga1.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Today Special',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
