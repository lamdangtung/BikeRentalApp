import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TextHeader({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
