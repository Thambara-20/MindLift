import 'package:flutter/material.dart';
import 'package:mortivate/utilities/constants.dart';
import '../widgets/intro/pages/animated_screen_slider.dart';
import '../widgets/intro/widgets/widgets.dart';

final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    title: 'Welcome to the \nMotivation Plus!',
    description: 'Your daily source of inspiration and mental \nwell-being.',
    imageAsset: 'assets/meditate.png',
    mainCircleBgColor: Color.fromARGB(255, 10, 53, 88),
  ),
  const SingleIntroScreen(
    title: 'Discover Positivity!',
    description:
        'Explore a world of motivational quotes and uplifting content.',
    imageAsset: 'assets/yoga1.png',
    mainCircleBgColor: Color.fromARGB(255, 11, 52, 86),
  ),
  const SingleIntroScreen(
    title: 'Nurture Your Mind!',
    description: 'Take a step towards mental health and self-care.',
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
          /// TODO: Navigate to desired page, such as login or home
        },
      ),
    );
  }
}
