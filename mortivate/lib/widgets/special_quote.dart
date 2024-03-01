import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mortivate/utilities/index.dart';
import 'package:mortivate/widgets/styled_button.dart';

class Specialquote extends StatelessWidget {
  final String quote;
  final String author;
  final Uint8List backgroundImage;

  Future<Uint8List> _generate(String query) async {
    Uint8List image = await generateImg(query);
    return image;
  }

  const Specialquote({
    Key? key,
    required this.quote,
    required this.author,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _generate('King'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Stack(children: [
            Positioned(
              bottom: 10,
              left: 10,
              child: StyledElevatedButton(
                height: 40,
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Icon(Icons.share,
                    size: 18, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Positioned(
              left: 80,
              bottom: 10,
              child: StyledElevatedButton(
                height: 40,
                borderRadius: BorderRadius.circular(20),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Icon(Icons.download,
                    size: 18, color: Color.fromARGB(255, 0, 0, 0)),
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
                bottom: 10,
                left: 10,
                child: StyledElevatedButton(
                  height: 40,
                  onPressed: () {
                    print('object');
                  },
                  child: const Icon(Icons.share,
                      size: 18, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Positioned(
                left: 80,
                bottom: 10,
                child: StyledElevatedButton(
                  height: 40,
                  borderRadius: BorderRadius.circular(20),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: const Icon(Icons.download,
                      size: 18, color: Color.fromARGB(255, 0, 0, 0)),
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

  const QuoteBodyContainer({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(141, 12, 154, 31),
            Color.fromARGB(0, 52, 74, 185),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Quote of the day',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '"Quote of the day"',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      author,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
