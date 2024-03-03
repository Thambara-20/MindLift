import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mortivate/screens/home.dart';
import 'package:mortivate/screens/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final prefs = await SharedPreferences.getInstance();
    runApp(MyApp(prefs: prefs));
  } catch (e) {}
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({
    super.key,
    required this.prefs,
  });

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
