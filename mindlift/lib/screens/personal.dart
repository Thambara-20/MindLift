import 'package:flutter/material.dart';
import 'package:mindlift/screens/personal/gender.personal.dart';
import 'package:mindlift/screens/personal/name.personal.dart';
import 'package:mindlift/screens/personal/situation.personal.dart';
import 'package:mindlift/widgets/styled_button.dart';

import '../widgets/progress_indicator.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPageSliderState createState() => _MyPageSliderState();
}

class _MyPageSliderState extends State<Personal> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 1;
  final List<Widget> _pages = [
    NamePage(),
    const GenderPage(),
    const SituationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 13, 10, 111),
                      Color.fromARGB(255, 10, 123, 38),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: _pages,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: StyledElevatedButton(
                        width: double.infinity,
                        onPressed: () {
                          if (_pageController.page! < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              pageIndex += 1;
                            });
                          } else {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        child: const Text('Next',
                            style: TextStyle(
                                color: Color.fromARGB(200, 255, 255, 255))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: IconButton(
              onPressed: () {
                if (pageIndex > 1) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    pageIndex -= 1;
                  });
                }
              },
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Color.fromARGB(208, 255, 255, 255)),
            ),
          ),
          Positioned(
              top: 10,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: CustomProgressIndicator(
                totalSteps: _pages.length,
                currentStep: pageIndex,
              )),
          Positioned(
            right: 8,
            child: TextButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  pageIndex += 1;
                });
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String text;

  const PageWidget({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
