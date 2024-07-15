import 'package:flutter/material.dart';

import '../../core/widgets/GradientContainer.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Center(
          child: Text('Favourites'),
        ),
      ),
    );
  }
}
