import 'package:flutter/material.dart';
import 'package:reading_tracker/core/routing/routes.dart';
import 'package:reading_tracker/features/books/presentation/views/books_view.dart';
import 'package:reading_tracker/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onReading:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
        );

      case Routes.allBoks:
        return MaterialPageRoute(
          builder: (context) => BooksView(),
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
