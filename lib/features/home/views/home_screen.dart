import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../cubit/HomeCubit.dart';
import '../cubit/home-states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, JokeState>(
          listener: (context, state) {
            if (state is JokeError) {
              // Optionally show a Snackbar or Dialog for error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();

            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Emoji Image
                        Container(
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0), // Add padding to the left
                            child: Stack(
                              children: [
                                Center(
                                  child: state is JokeLoading
                                      ? Lottie.asset('assets/lotti.json' , height: 200, width: 200)
                                      : state is JokeError
                                      ? Text(
                                    state.message,
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  )
                                      : state is JokeSuccess
                                      ? state.joke.type == 'single'
                                      ? Text(
                                    state.joke.joke ?? 'Error',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  )
                                      : state.joke.type == 'twopart'
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.joke.setup ?? 'Error',
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        state.joke.delivery ?? 'Error',
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  )
                                      : Text(
                                    "😜",
                                    style: TextStyle(fontSize: 100, color: Colors.white),
                                  )
                                      : Text(
                                    "😜",
                                    style: TextStyle(fontSize: 100, color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.repeat,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Input Field
                        SizedBox(height: 30),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              cubit.updateSearchText(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for a joke...',
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Dropdown Menus
                        Container(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dropdown 1 - Category
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.black.withOpacity(0.9),
                                    value: state.selectedCategory,
                                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                                    iconSize: 24,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        cubit.updateCategory(newValue);
                                      }
                                    },
                                    items: <String>['Programming', 'Misc', 'Dark', 'Pun', 'Spooky', 'Christmas']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              // Dropdown 2 - Blacklist Flags
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.black.withOpacity(0.9),
                                    value: state.selectedBlacklistFlag,
                                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                                    iconSize: 24,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        cubit.updateBlacklistFlag(newValue);
                                      }
                                    },
                                    items: <String>['nsfw', 'religious', 'political', 'racist', 'sexist', 'explicit']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              // Dropdown 3 - Type
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.black.withOpacity(0.9),
                                    value: state.selectedType,
                                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                                    iconSize: 24,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        cubit.updateType(newValue);
                                      }
                                    },
                                    items: <String>['single', 'twopart']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
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
                            cubit.fetchJoke();
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
              ),
            );
          },
        ),
      ),
    );
  }
}
