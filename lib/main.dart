import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reading_tracker/core/helpers/cache_helper.dart';
import 'package:reading_tracker/core/routing/app_router.dart';
import 'package:reading_tracker/reading_tracker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.initSharedPrefCaching();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('ar'),],
      fallbackLocale: Locale('en'),
      child: ReadingTracker(
        appRouter: AppRouter(),
      ),
    ),
  );
}
