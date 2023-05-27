import 'package:flutter/material.dart';

class CustomeSubHeader extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomeSubHeader(
      {super.key, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
    );
  }
}
