import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reading_tracker/core/themes/text_themes.dart';
import 'package:reading_tracker/features/books/presentation/views/all_books_screens.dart';
import 'package:reading_tracker/features/books/presentation/views/reading_now_view.dart';
import 'package:reading_tracker/features/favorite/presentation/views/favoite_screen.dart';
import 'package:reading_tracker/features/qoutes/presentation/views/quotes_screen.dart';
import 'package:reading_tracker/features/settings/presentation/views/settings_view.dart';

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

  final List<String> titles = [
    'All Books',
    'Reading Now',
    'Favorite',
    'Quotes',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 50,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu_rounded,
            size: 28,
          ),
        ),
        iconTheme: IconThemeData(),
        title: Text(
          titles[selectedIndex],
          style: AppTextStyles.font20Regular,
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
                  Icon(
                    FontAwesomeIcons.book,
                    size: 32,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Readon',
                    style: AppTextStyles.font18Regular,
                  ),
                ],
              ),
            ),
            buildDrawerItem(
                icon: FontAwesomeIcons.book, label: 'All Books', index: 0),
            buildDrawerItem(
                icon: FontAwesomeIcons.bookOpenReader,
                label: 'Reading Now',
                index: 1),
            buildDrawerItem(
                icon: FontAwesomeIcons.solidHeart, label: 'Favorite', index: 2),
            buildDrawerItem(
                icon: FontAwesomeIcons.quoteRight, label: 'Quotes', index: 3),
            buildDrawerItem(
                icon: FontAwesomeIcons.gear, label: 'Settings', index: 4),
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
