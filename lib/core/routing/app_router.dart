import 'package:flutter/material.dart';
import 'package:jokes_app/core/routing/routes.dart';
import 'package:jokes_app/features/home/views/Tabbar.dart';
import 'package:jokes_app/features/login/LoginScreen.dart';

import '../../features/splash_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        case Routes.home:
        return MaterialPageRoute(builder: (_) => MyTabBar());
    // case '/register':
    //   return MaterialPageRoute(builder: (_) => RegisterScreen());
    // case '/profile':
    //   return MaterialPageRoute(builder: (_) => ProfileScreen());
    // case '/settings':
    //   return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(body: Center(
                child: Text('No route defined for ${settings.name}'))));
    }
  }
}