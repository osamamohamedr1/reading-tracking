import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reading_tracker/core/routing/app_router.dart';
import 'package:reading_tracker/core/routing/routes.dart';
import 'package:reading_tracker/core/themes/app_themes.dart';
import 'package:reading_tracker/features/settings/logic/cubit/theme_cubit.dart';
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
            initialRoute: Routes.drawer,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeState,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
