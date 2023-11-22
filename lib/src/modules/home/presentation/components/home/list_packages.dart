import 'package:flutter/material.dart';

import 'card_my_packages.dart';
import 'list_packages_header.dart';

class ListPackages extends StatelessWidget {
  const ListPackages({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: screen.width,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListPackagesHeader(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, int index) {
                  return CardMyPackages(screen: screen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
