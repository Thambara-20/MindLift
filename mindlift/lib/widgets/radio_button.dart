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
            return const Color.fromARGB(255, 0, 26, 99);
          },
        ),
      ),
    );
  }
}
