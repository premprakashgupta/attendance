import 'dart:math';

import 'package:flutter/material.dart';

class CustomeColors {
  static Color scaffoldBg = const Color(0xfff9f9f9);
  static Color iconColor = const Color(0xff000000);
  static Color imgBg = const Color.fromARGB(255, 241, 240, 240);
  static Color shadow = const Color(0xffcccccc);
  static Color caption = const Color(0xffcccccc);
  static Color headingclr = const Color(0xff333333);
  static Color mainclr = const Color(0xffDA3F3F);

  static Color getRandomColor() {
    Random random = Random();
    int red = random.nextInt(255);
    int green = random.nextInt(255);
    int blue = random.nextInt(255);

    // Ensure the generated color is not white
    if (red > 200 && green > 200 && blue > 200) {
      // Adjust one of the color channels to make it non-white
      int channelIndex = random.nextInt(3);
      if (channelIndex == 0) {
        red = random.nextInt(200);
      } else if (channelIndex == 1) {
        green = random.nextInt(200);
      } else {
        blue = random.nextInt(200);
      }
    }

    return Color.fromARGB(255, red, green, blue);
  }

  static Color getColorFromHexString(String hexString) {
    final hexCode = hexString.replaceAll('Color(', '').replaceAll(')', '');
    final hexColor = hexCode.replaceAll('0x', '');
    final intColor = int.parse(hexColor, radix: 16);
    return Color(intColor);
  }
}
