import 'package:flutter/material.dart';

import '../components/home_page_header.dart';
import '../components/menu/menu_chips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HomePageHeader(),
            Column(
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
