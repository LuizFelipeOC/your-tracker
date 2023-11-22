import 'package:flutter/material.dart';

import '../components/home/list_packages.dart';
import '../components/home_page_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const HomePageHeader(),
        ListPackages(screen: screen),
      ],
    );
  }
}
