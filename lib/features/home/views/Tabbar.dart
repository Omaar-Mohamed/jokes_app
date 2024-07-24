import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/features/home/views/home_screen.dart';

import '../../../core/routing/routes.dart';
import '../../favourit/FavScreen.dart';
import '../../login/cubit/AuthCubit.dart';
import '../../login/cubit/auth_state.dart';

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
                TextSpan(
                    text: 'Replies', style: TextStyle(color: Colors.orange)),
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
          actions: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSignedOut) {
                  Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
                } else if (state is AuthSignInFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("sginup failed"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {

                return IconButton(
                  icon: Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                );
              },
            ),

          ],
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