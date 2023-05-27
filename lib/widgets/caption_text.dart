import 'package:flutter/material.dart';

class CustomeCaption extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomeCaption({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: color,
      ),
    );
  }
}
