import 'package:flutter/material.dart';

import '../components/drawers/home_drawer.dart';
import '../components/home_page_header.dart';
import '../components/menu/menu_chips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: HomeDrawer(screen: screen),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HomePageHeader(scaffoldState: scaffoldKey),
            const Column(
              children: [
                MenuChips(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
