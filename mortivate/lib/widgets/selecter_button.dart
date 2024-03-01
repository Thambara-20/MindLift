// mood_radio_button.dart
import 'package:flutter/material.dart';

class MoodRadioButton extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final IconData icon;

  const MoodRadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: groupValue == value
                ? const Color.fromARGB(188, 8, 20, 97)
                : const Color.fromARGB(131, 7, 136, 33),
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          color: groupValue == value
              ? const Color.fromARGB(92, 3, 19, 39)
              : const Color.fromARGB(41, 66, 143, 194),
        ),
        child: ListTile(
          title: Text(
            label,
            style: const TextStyle(color: Color.fromARGB(198, 255, 255, 255)),
          ),
          leading: Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Icon(
              size: 35,
              icon,
              color: const Color.fromARGB(198, 255, 255, 255),
            ),
          ),
          contentPadding: const EdgeInsets.all(1),
          horizontalTitleGap: 15,
          minLeadingWidth: 0,
          selected: groupValue == value,
        ),
      ),
    );
  }
}
