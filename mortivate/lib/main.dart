import 'package:flutter/material.dart';
import 'package:mortivate/widgets/next_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
