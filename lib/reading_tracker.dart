import 'package:flutter/material.dart';
import 'package:reading_tracker/core/routing/app_router.dart';
import 'package:reading_tracker/features/home/logic/cubit/theme_cubit.dart';
import 'package:reading_tracker/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingTracker extends StatelessWidget {
  const ReadingTracker({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            darkTheme: ThemeData(),
            themeMode: theme,
            onGenerateRoute: appRouter.generateRoute,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
