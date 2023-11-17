import 'package:flutter/material.dart';

import 'card_search_packages.dart';

class ListSearchPackages extends StatelessWidget {
  const ListSearchPackages({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CardSearchPackages(screen: screen),
          );
        },
      ),
    );
  }
}
