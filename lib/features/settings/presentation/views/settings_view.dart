import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_tracker/features/settings/logic/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentThemeMode = context.watch<ThemeCubit>().state;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 25),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Theme'),
              shape: tileShape(borderColor: Colors.lightBlueAccent),
              collapsedShape: tileShape(),
              children: [
                themeSelctionItem(
                    selected: currentThemeMode == ThemeMode.system,
                    icon: Icons.mobile_friendly,
                    title: 'System',
                    onTap: () =>
                        context.read<ThemeCubit>().setTheme(ThemeMode.system)),
                themeSelctionItem(
                    selected: currentThemeMode == ThemeMode.light,
                    icon: Icons.light_mode,
                    title: 'Light',
                    onTap: () =>
                        context.read<ThemeCubit>().setTheme(ThemeMode.light)),
                themeSelctionItem(
                  selected: currentThemeMode == ThemeMode.dark,
                  icon: Icons.dark_mode,
                  title: 'Dark',
                  onTap: () =>
                      context.read<ThemeCubit>().setTheme(ThemeMode.dark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget themeSelctionItem(
      {required IconData icon,
      required String title,
      required void Function()? onTap,
      required bool selected}) {
    return ListTile(
      selected: selected,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title),
    );
  }

  OutlineInputBorder tileShape({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: .3, color: borderColor ?? Colors.grey),
    );
  }
}
