import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
            icon: Icon(FontAwesomeIcons.list)),
        iconTheme: IconThemeData(),
      ),
      drawer: Drawer(),
    );
  }
}
