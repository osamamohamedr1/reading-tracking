import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reading_tracker/core/helpers/assets.dart';
import 'package:reading_tracker/core/helpers/exentions.dart';
import 'package:reading_tracker/core/routing/routes.dart';
import 'package:reading_tracker/core/themes/text_themes.dart';
import 'package:reading_tracker/features/books/presentation/views/all_books_screens.dart';
import 'package:reading_tracker/features/books/presentation/views/reading_now_view.dart';
import 'package:reading_tracker/features/favorite/presentation/views/favoite_screen.dart';
import 'package:reading_tracker/features/qoutes/presentation/views/quotes_screen.dart';
import 'package:reading_tracker/features/settings/presentation/views/settings_view.dart';
import 'package:reading_tracker/generated/locale_keys.g.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int selectedIndex = 0;

  final List<Widget> screens = const [
    AllBooksScreen(),
    ReadingNowScreen(),
    FavoiteScreen(),
    QuotesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      LocaleKeys.all_books.tr(),
      LocaleKeys.reading_now.tr(),
      LocaleKeys.favorite.tr(),
      LocaleKeys.quotes.tr(),
      LocaleKeys.settings.tr(),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 47,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu_rounded,
            size: 26,
          ),
        ),
        iconTheme: IconThemeData(),
        title: Text(
          titles[selectedIndex],
          style: AppTextStyles.font18Regular,
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width / 1.3,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    fit: BoxFit.contain,
                    Assets.imagesBookIcon3,
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Readon',
                    style: AppTextStyles.font20Regular,
                  ),
                ],
              ),
            ),
            buildDrawerItem(
                icon: FontAwesomeIcons.book,
                label: LocaleKeys.all_books.tr(),
                index: 0),
            buildDrawerItem(
                icon: FontAwesomeIcons.bookOpenReader,
                label: LocaleKeys.reading_now.tr(),
                index: 1),
            buildDrawerItem(
                icon: FontAwesomeIcons.solidHeart,
                label: LocaleKeys.favorite.tr(),
                index: 2),
            buildDrawerItem(
                icon: FontAwesomeIcons.quoteRight,
                label: LocaleKeys.quotes.tr(),
                index: 3),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.gear,
                size: 22,
              ),
              title: Text(
                LocaleKeys.settings.tr(),
              ),
              selected: false,
              onTap: () {
                context.pop();
                context.pushNamed(Routes.settings);
              },
            )
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }

  Widget buildDrawerItem(
      {required IconData icon, required String label, required int index}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(label),
      selected: selectedIndex == index,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }
}
