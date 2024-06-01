import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CustomProgressIndicator({super.key, 
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 4,
          decoration: BoxDecoration(
            color: index < currentStep
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 120, 98, 98).withOpacity(0.5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
