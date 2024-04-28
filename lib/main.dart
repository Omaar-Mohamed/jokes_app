import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_app.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp( JokesApp(
    appRouter: AppRouter(),
  ));
}


