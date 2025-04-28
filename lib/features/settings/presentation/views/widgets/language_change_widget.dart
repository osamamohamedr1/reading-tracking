import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reading_tracker/core/helpers/exentions.dart';
import 'package:reading_tracker/core/themes/text_themes.dart';

class LanguageChangeWidget extends StatelessWidget {
  const LanguageChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetAnimationCurve: Curves.bounceIn,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'language'.tr(),
                      style: AppTextStyles.font20Regular,
                    ),
                    ListTile(
                      minTileHeight: 50,
                      onTap: () {
                        context.setLocale(Locale('ar'));
                        context.pop();
                      },
                      tileColor: Colors.transparent,
                      title: Text(
                        'العربية',
                        style: AppTextStyles.font16Regular,
                      ),
                    ),
                    ListTile(
                      minTileHeight: 50,
                      onTap: () {
                        context.setLocale(Locale('en'));
                        context.pop();
                      },
                      tileColor: Colors.transparent,
                      title: Text(
                        'English',
                        style: AppTextStyles.font16Regular,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: .01, color: Colors.grey),
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            shape: OutlineInputBorder(
              borderSide: BorderSide(width: .01, color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            minTileHeight: 60,
            leading: Icon(
              Icons.language,
              size: 26,
            ),
            title: Text(
              'language'.tr(),
              style: AppTextStyles.font16Regular,
            ),
            subtitle: Text(
              context.locale.toString() == 'ar' ? 'العربية' : 'English',
              style: AppTextStyles.font14Regular.copyWith(color: Colors.grey),
            ),
          )),
    );
  }
}
