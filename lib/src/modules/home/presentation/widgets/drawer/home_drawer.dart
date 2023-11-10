import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import 'home_drawer_header.dart';
import 'home_drawer_options.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: AppColors.white,
      ),
      width: screen.width * .8,
      child: Column(
        children: [
          Expanded(
            child: HomeDrawerHeader(screen: screen),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeDrawerOptions(
                  icon: Icons.search,
                  title: 'Find Package',
                  onTap: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
