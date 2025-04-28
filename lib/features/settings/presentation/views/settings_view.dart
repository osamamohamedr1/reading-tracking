import 'package:flutter/material.dart';

import 'package:reading_tracker/features/settings/presentation/views/widgets/language_change_widget.dart';
import 'package:reading_tracker/features/settings/presentation/views/widgets/theme_selection_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 5),
            ThemeSelectionWidget(),
            Builder(builder: (context) {
              return LanguageChangeWidget();
            }),
          ],
        ),
      ),
    );
  }
}
