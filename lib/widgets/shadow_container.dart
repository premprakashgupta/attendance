import 'package:flutter/material.dart';
import 'package:attendance/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  const CustomContainer(
      {super.key,
      required this.child,
      this.width,
      this.padding = const EdgeInsets.all(8),
      this.height,
      this.margin = const EdgeInsets.all(8)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 5.0,
                color: CustomeColors.shadow)
          ]),
      child: child,
    );
  }
}
