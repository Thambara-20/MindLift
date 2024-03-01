import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mortivate/screens/home.dart';
import 'package:mortivate/screens/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(172, 0, 0, 0),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroScreen.routeName: (context) => const IntroScreen(),
        Home.routeName: (context) => const Home(),
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}

