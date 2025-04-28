import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:reading_tracker/features/settings/presentation/views/widgets/language_change_widget.dart';
import 'package:reading_tracker/features/settings/presentation/views/widgets/theme_selection_widget.dart';
import 'package:reading_tracker/generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 5),
            ThemeSelectionWidget(),
            LanguageChangeWidget(),
          ],
        ),
      ),
    );
  }
}
