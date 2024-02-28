import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mortivate/screens/intro.dart';
import 'package:mortivate/widgets/next_button.dart';

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
        MyHomePage.routeName: (context) => const MyHomePage(),
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String routeName = '/home';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mortivate'),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Welcome to Mortivate!',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  StyledElevatedButton(
                    onPressed: () => print('Get Started'),
                    borderRadius: BorderRadius.circular(10),
                    child: const Text('Get Started',
                        style: TextStyle(color: Colors.white)),
                  )
                ])));
  }
}
