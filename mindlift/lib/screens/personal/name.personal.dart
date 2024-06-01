import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent, // Adjust the color as needed
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hey there! Is there a nickname or special word you'd like us to use?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'This name will be the source of inspiration for your personalized motivational quotes in the future',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Your Name or Nickname',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 83, 83, 83)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
