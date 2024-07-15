import 'package:flutter/material.dart';

import '../../core/routing/routes.dart';
import '../../core/widgets/GradientContainer.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/funny.png', height: 100),
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
              Spacer(),
              _buildTextField('Email'),
              SizedBox(height: 20),
              _buildTextField('Password', obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle sign-in logic
                },
                child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Colors.white,),


                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFED8811).withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google sign-in logic
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                },
                icon: Image.asset('assets/google1.jpg', height: 24),
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black12),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(9.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
