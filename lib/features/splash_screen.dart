import 'package:flutter/material.dart';
import 'dart:async';

import '../core/routing/routes.dart';
import '../core/widgets/GradientContainer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/funny.png', height: 150),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(text: 'Funny', style: TextStyle(color: Colors.white)),
                    TextSpan(text: 'Replies', style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'v1.0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
