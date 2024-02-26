import 'package:flutter/material.dart';
import 'package:mortivate/screens/constants/constants.dart';
import 'pages/animated_screen_slider.dart';
import 'widgets/widgets.dart';

final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    title: 'Welcome to the Motivation Plus !',
    description:
        'You plans your Events, We\'ll do the rest and will be the best! Guaranteed!  ',
    imageAsset: 'assets/meditate.png',
    mainCircleBgColor: Color.fromARGB(255, 10, 53, 88),
  ),
  const SingleIntroScreen(
    title: 'Book tickets to cricket matches and events',
    description:
        'Tickets to the latest movies, crickets matches, concerts, comedy shows, plus lots more !',
    imageAsset: 'assets/yoga1.png',
    mainCircleBgColor: Color.fromARGB(255, 11, 52, 86),
  ),
  const SingleIntroScreen(
    title: 'Grabs all events now only in your hands',
    description: 'All events are now in your hands, just a click away ! ',
    imageAsset: 'assets/yoga2.png',
    mainCircleBgColor: Color.fromARGB(255, 11, 52, 86),
  ),
];

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        slides: pages,
        indicatorType: IndicatorType.circle,
        onDone: () {
          /// TODO: Go to desire page like login or home
        },
      ),
    );
  }
}
