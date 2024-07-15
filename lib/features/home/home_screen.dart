import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jokes_app/core/widgets/GradientContainer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue1 = 'Option 1';
  String dropdownValue2 = 'Option 1';
  String dropdownValue3 = 'Option 1';
  String dropdownValue4 = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xFFED8811).withOpacity(0.9),
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Emoji Image
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "😜", // Use an emoji or replace with Image.asset('path/to/your/image.png')
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Input Field
              Container(
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What do you need response to?',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Dropdown Menus
              Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dropdown 1
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black.withOpacity(0.9),
                          value: dropdownValue1,
                          icon: Icon(Icons.arrow_downward, color: Colors.white),
                          iconSize: 24,
                          style: TextStyle(color: Colors.white),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Dropdown 2
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black.withOpacity(0.9),
                          value: dropdownValue2,
                          icon: Icon(Icons.arrow_downward, color: Colors.white),
                          iconSize: 24,
                          style: TextStyle(color: Colors.white),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Dropdown 3
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black.withOpacity(0.9),
                          value: dropdownValue3,
                          icon: Icon(Icons.arrow_downward, color: Colors.white),
                          iconSize: 24,
                          style: TextStyle(color: Colors.white),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue3 = newValue!;
                            });
                          },
                          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Dropdown 4

                  ],
                ),
              ),
              SizedBox(height: 20),
              // Generate Response Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFED8811).withOpacity(0.9),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Text(
                  'Generate Response',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}