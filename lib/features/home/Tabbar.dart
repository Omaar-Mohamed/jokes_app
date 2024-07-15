import 'package:flutter/material.dart';
import 'package:jokes_app/features/home/home_screen.dart';

import '../favourit/FavScreen.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: RichText(
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
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Color(0xFFED8811).withOpacity(0.9),
            labelColor: Color(0xFFED8811).withOpacity(0.9),
            unselectedLabelColor: Colors.white.withOpacity(0.6),
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Favourites"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            FavScreen(),
          ],
        ),
      ),
    );
  }
}