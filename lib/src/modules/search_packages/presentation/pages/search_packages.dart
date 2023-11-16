import 'package:flutter/material.dart';

import '../components/list_search_packages.dart';
import '../components/search_packages_header.dart';

class SearchPackagesPage extends StatefulWidget {
  const SearchPackagesPage({super.key});

  @override
  State<SearchPackagesPage> createState() => _SearchPackagesPageState();
}

class _SearchPackagesPageState extends State<SearchPackagesPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: screen.width,
          height: screen.height,
          child: Column(
            children: [
              SearchPackagesHeader(screen: screen),
              ListSearchPackages(screen: screen),
            ],
          ),
        ),
      ),
    );
  }
}
