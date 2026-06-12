import 'package:flutter/material.dart';

class DecorativeCircle extends StatelessWidget {
  final double top;
  final double left;

  const DecorativeCircle({super.key, required this.top, required this.left});
  @override
  Widget build(BuildContext context) {
    // Top decorative circle
    return Positioned(
      top: top,
      left: left,
      right: left,
      child: Image.asset(
        'assets/circle_bull.png',
        height: 1000,
        opacity: const AlwaysStoppedAnimation(0.5),
      ),
    );
    // Bottom decorative circle
  }
}
