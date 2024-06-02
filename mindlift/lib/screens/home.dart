import 'package:flutter/material.dart';
import 'package:mindlift/screens/menu.dart';
import 'package:mindlift/widgets/styled_button.dart';
import 'package:mindlift/widgets/quote_container.dart';
import 'package:mindlift/widgets/special_quote.dart';

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 18, 41, 21),
                Color.fromARGB(255, 12, 41, 99),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: MiddlePageList(),
                    ),
                    Positioned(
                      right: 4,
                      top: 0,
                      child: StyledElevatedButton(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                        height: 50,
                        width: 60,
                        onPressed: () {},
                        child: const Icon(Icons.settings,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: StyledElevatedButton(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(10),
                            ),
                            onPressed: () {
                              Menu.show(context);
                            },
                            height: 50,
                            width: 100,
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
      ),
    );
  }
}

class MiddlePageList extends StatelessWidget {
  const MiddlePageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.96,
      child: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Specialquote(
                quote: 'Doubt kills more dreams than failure ever will.',
                author: 'Suzy Kassem',
              );
            } else {
              return QuoteContainer(quote: 'Quote $index', author: 'Author');
            }
          },
        ),
      ),
    );
  }
}
