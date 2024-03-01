import 'package:flutter/material.dart';
import 'package:mortivate/widgets/brain_fusion.dart';
import 'package:mortivate/widgets/next_button.dart';
import 'package:mortivate/widgets/quote_container.dart';

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
              Color.fromARGB(255, 5, 104, 12),
              Color.fromARGB(255, 12, 41, 99),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    // Component for middle screen daily quotes image container
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: 0,
                    right: 0,
                    child: const MiddlePageList(),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Test(title: 'Brain Fusion');
                            }));
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

class MiddlePageList extends StatelessWidget {
  const MiddlePageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.98,
      child: Column(children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return QuoteContainer(
              quote: 'Quote $index',
              author: 'Author Name',
            );
          },
        ),
      ]),
    );
  }
}
