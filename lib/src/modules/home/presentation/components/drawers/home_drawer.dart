import 'package:flutter/material.dart';

import 'unauthenticated_body_drawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      width: screen.width * .8,
      child: Column(
        children: [
          UnauthenticatedBodyDrawer(screen: screen),
        ],
      ),
    );
  }
}
