import 'package:flutter/material.dart';
import 'dart:ui';

class GradientContainer extends StatelessWidget {
  final Widget child;

  GradientContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black, // Black at the top
                Color(0xFFED8811).withOpacity(0.9), // Dark brownish color in the center
                Colors.black, // Black at the bottom
              ],
              stops: [0.0, 0.5, 1.0], // Define the stops for the colors
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}


