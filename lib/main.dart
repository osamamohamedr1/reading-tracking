import 'package:flutter/material.dart';
import 'package:reading_tracker/core/helpers/cache_helper.dart';
import 'package:reading_tracker/core/routing/app_router.dart';
import 'package:reading_tracker/reading_tracker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.initSharedPrefCaching();
  runApp(ReadingTracker(appRouter: AppRouter()));
}
