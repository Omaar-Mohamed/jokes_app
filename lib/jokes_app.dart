import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jokes_app/core/routing/routes.dart';
import 'package:jokes_app/core/theming/colors.dart';

import 'core/routing/app_router.dart';

class JokesApp extends StatelessWidget {
  final AppRouter appRouter;
  const JokesApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Jokes App',
        theme: ThemeData(
          primaryColor: ColorsManager.primary,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}

