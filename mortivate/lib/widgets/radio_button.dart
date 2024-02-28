import 'package:flutter/material.dart';

class GenderRadioButton extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const GenderRadioButton({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: groupValue == value
              ? Color.fromARGB(76, 0, 0, 0)
              : const Color.fromARGB(167, 41, 114, 140),
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
            ? Color.fromARGB(255, 6, 42, 87)
            : Color.fromARGB(167, 41, 114, 140),
      ),
      child: RadioListTile(
        title: Text(label,
            style: const TextStyle(color: Color.fromARGB(198, 255, 255, 255))),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        hoverColor: Colors.black12,
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const Color.fromARGB(194, 255, 255, 255);
            }
            return const Color.fromARGB(
                255, 0, 26, 99); // Use the default value.
          },
        ),
      ),
    );
  }
}
