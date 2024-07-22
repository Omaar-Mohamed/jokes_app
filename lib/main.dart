import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/firebase_options.dart';
import 'package:jokes_app/jokes_app.dart';

import 'core/routing/app_router.dart';
import 'features/login/cubit/AuthCubit.dart';

Future <void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    BlocProvider(
      create: (_) => AuthCubit(),
      child: JokesApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}


