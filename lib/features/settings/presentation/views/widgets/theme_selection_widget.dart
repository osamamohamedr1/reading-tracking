import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_tracker/features/settings/logic/cubit/theme_cubit.dart';
import 'package:reading_tracker/features/settings/presentation/views/widgets/theme_selection_item.dart';

class ThemeSelectionWidget extends StatelessWidget {
  const ThemeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentThemeMode = context.watch<ThemeCubit>().state;
    return ExpansionTile(
      title: Text('theme'.tr()),
      shape: tileShape(borderColor: Colors.lightBlueAccent),
      collapsedShape: tileShape(),
      children: [
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.system,
            icon: Icons.mobile_friendly,
            title: 'system'.tr(),
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.system)),
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.light,
            icon: Icons.light_mode,
            title: 'light'.tr(),
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.light)),
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.dark,
            icon: Icons.dark_mode,
            title: 'dark'.tr(),
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.dark)),
      ],
    );
  }

  OutlineInputBorder tileShape({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: .01, color: borderColor ?? Colors.grey),
    );
  }
}
