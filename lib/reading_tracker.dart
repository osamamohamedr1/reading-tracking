import 'package:flutter/material.dart';
import 'package:reading_tracker/core/routing/app_router.dart';
import 'package:reading_tracker/core/themes/app_themes.dart';
import 'package:reading_tracker/features/settings/logic/cubit/theme_cubit.dart';
import 'package:reading_tracker/features/drawer/presentation/views/custom_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingTracker extends StatelessWidget {
  const ReadingTracker({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeState,
            onGenerateRoute: appRouter.generateRoute,
            home: CustomDrawer(),
          );
        },
      ),
    );
  }
}
