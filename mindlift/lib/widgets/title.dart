import 'package:flutter/material.dart';

class StyledTitle extends StatelessWidget {
  final String title;
  const StyledTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(84, 9, 71, 92),
              Color.fromARGB(0, 52, 74, 185),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Color.fromARGB(255, 128, 169, 185),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
