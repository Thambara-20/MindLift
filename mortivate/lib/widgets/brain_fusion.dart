/// Importing the 'dart:io' package to detect the platform, the 'brain_fusion' package for AI processing, the 'flutter/foundation.dart' package for debugging, and the 'flutter/material.dart' package for widget building.import 'dart:io' show Platform;
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mortivate/utilities/index.dart';

class Test extends StatefulWidget {
  final String title;

  const Test({Key? key, required this.title}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool run = false;

  Future<Uint8List> _generate(String query) async {
    Uint8List image = await generateImg(query);
    return image;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// The size of the container for the generated image.
    final double size = Platform.isAndroid || Platform.isIOS
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: size,
                width: size,
                child: run
                    ? FutureBuilder<Uint8List>(
                        future: _generate(widget.title),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Image.memory(snapshot.data!);
                          } else {
                            return Container();
                          }
                        },
                      )
                    : const Center(
                        child: Text(
                          'Enter Text and Click the button to generate',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            run = true;
          });
        },
        tooltip: 'Generate',
        child: const Icon(Icons.gesture),
      ),
    );
  }
}
