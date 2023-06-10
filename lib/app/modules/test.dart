import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyEqualizerLoader extends StatefulWidget {
  @override
  _GlassyEqualizerLoaderState createState() => _GlassyEqualizerLoaderState();
}

class _GlassyEqualizerLoaderState extends State<GlassyEqualizerLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  List<double> _barHeights = [40, 30, 50, 20, 45];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _timer = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      setState(() {
        _barHeights.shuffle();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: ,
          // ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Center(
            child: ClipRect(
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _barHeights.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: _barHeights[index],
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
