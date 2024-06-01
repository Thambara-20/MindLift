// gender_page.dart
import 'package:flutter/material.dart';
import 'package:mindlift/widgets/selecter_button.dart';

class SituationPage extends StatefulWidget {
  const SituationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SituationPageState createState() => _SituationPageState();
}

class _SituationPageState extends State<SituationPage> {
  String? selectedMood;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Okay How are you feeling today ?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'the selected mood will be used for categorize quotes, Select your current mood.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MoodRadioButton(
              label: 'Excellent',
              value: 'Excellent',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_very_satisfied,
            ),
            MoodRadioButton(
              label: 'Good',
              value: 'Good',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_satisfied,
            ),
            MoodRadioButton(
              label: 'Neutral',
              value: 'Neutral',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_neutral,
            ),
            MoodRadioButton(
              label: 'Bad',
              value: 'Bad',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_dissatisfied,
            ),
            MoodRadioButton(
              label: 'Worst',
              value: 'Worst',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_very_dissatisfied,
            ),
            MoodRadioButton(
              label: 'Other',
              value: 'Other',
              onChanged: (value) => setState(() => selectedMood = value),
              groupValue: selectedMood,
              icon: Icons.sentiment_neutral_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
