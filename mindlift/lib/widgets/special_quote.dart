import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mindlift/utilities/index.dart';
import 'package:mindlift/widgets/gradient_text.dart';
import 'package:mindlift/widgets/styled_button.dart';

class Specialquote extends StatelessWidget {
  final String quote;
  final String author;

  Future<Uint8List> _generate(String query) async {
    Uint8List image = await generateImg(query);
    return image;
  }

  const Specialquote({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _generate('King'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Stack(children: [
            Positioned(
              bottom: 15,
              left: 15,
              child: StyledElevatedButton(
                height: 40,
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Icon(Icons.share,
                    size: 18, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Positioned(
              left: 85,
              bottom: 15,
              child: StyledElevatedButton(
                height: 40,
                borderRadius: BorderRadius.circular(20),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Icon(Icons.download,
                    size: 18, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const QuoteBodyContainer(quote: 'quote', author: 'Author')
          ]);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.memory(
                    snapshot.data!,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: StyledElevatedButton(
                  height: 40,
                  onPressed: () {
                    print('object');
                  },
                  child: const Icon(Icons.share,
                      size: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              Positioned(
                left: 85,
                bottom: 15,
                child: StyledElevatedButton(
                  height: 40,
                  borderRadius: BorderRadius.circular(20),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: const Icon(Icons.download,
                      size: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              const QuoteBodyContainer(quote: 'quote', author: 'Author')
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class QuoteBodyContainer extends StatelessWidget {
  final String quote;
  final String author;
  final String height;

  const QuoteBodyContainer({
    Key? key,
    required this.quote,
    required this.author,
    this.height = '100',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == '100' ? MediaQuery.of(context).size.height * 0.95 : 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(84, 9, 71, 92),
            Color.fromARGB(0, 52, 74, 185),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(height == '100' ? 16.0 : 12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                backgroundBlendMode: BlendMode.lighten,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(183, 255, 255, 255),
                    Color.fromARGB(170, 211, 211, 211),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: GradientText(
                    text: 'Doubt kills more dreams than failure ever will.',
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 0, 39, 110),
                        Color.fromARGB(255, 3, 111, 30),
                      ],
                    ),
                    type: Type.text,
                    style: TextStyle(
                      fontSize: height == '100' ? 24 : 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: height == '100'
                  ? Alignment.center
                  : AlignmentDirectional.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(height == '100' ? 16.0 : 2.0),
                      child: Text(
                        '- Suzy Kassem',
                        style: TextStyle(
                          fontSize: height == '100' ? 24 : 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(height == '100' ? 18.0 : 4.0),
                      child: Text(
                        author,
                        style: TextStyle(
                          fontSize: height == '100' ? 16 : 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
