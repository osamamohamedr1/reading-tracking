import 'package:flutter/material.dart';
import 'package:reading_tracker/core/routing/routes.dart';
import 'package:reading_tracker/features/books/presentation/views/all_books_screens.dart';
import 'package:reading_tracker/features/drawer/presentation/views/custom_drawer.dart';
import 'package:reading_tracker/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:reading_tracker/features/settings/presentation/views/settings_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.drawer:
        return MaterialPageRoute(
          builder: (context) => CustomDrawer(),
        );
      case Routes.onReading:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
        );

      case Routes.allBoks:
        return MaterialPageRoute(
          builder: (context) => AllBooksScreen(),
        );

      case Routes.settings:
        return MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route founded in ${settings.name}')),
          ),
        );
    }
  }
}
