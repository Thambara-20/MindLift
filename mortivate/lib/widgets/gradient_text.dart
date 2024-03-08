import 'package:flutter/material.dart';

enum Type { text, icon }

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.gradient,
    required this.type,
    this.text = '',
    this.icon = const Icon(Icons.ac_unit),
    this.style,
  });

  final Icon icon;
  final String text;
  final TextStyle? style;
  final Type type;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    if (type == Type.text) {
      return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => gradient.createShader(bounds),
        child: Text(
          text,
          style: style,
        ),
      );
    }
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => gradient.createShader(bounds),
        child: icon);
  }
}
