import 'package:flutter/material.dart';
import 'package:mortivate/widgets/radio_button.dart';

class GenderPage extends StatefulWidget {
  GenderPage({Key? key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

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
              "Okay, How do you identify your gender?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'We use this information to categorize quotes and to help you stay motivated.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            GenderRadioButton(
              groupValue: selectedGender,
              value: 'Male',
              onChanged: (value) => setState(() => selectedGender = value),
              label: 'Male',
            ),
            GenderRadioButton(
              label: 'Female',
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            GenderRadioButton(
              label: 'Other',
              value: 'Other',
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            GenderRadioButton(
              label: 'Prefer not to say',
              value: 'Prefer not to say',
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
          ],
        ),
      ),
    );
  }
}
