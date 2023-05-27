import 'package:flutter/material.dart';

class CustomeHeader extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomeHeader(
      {super.key, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w600),
    );
  }
}
