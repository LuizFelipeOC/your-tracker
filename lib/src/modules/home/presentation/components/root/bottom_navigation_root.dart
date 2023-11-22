import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/font_awesome/font_awesome.dart';
import '../../controller/root_controller.dart';

class BottomNavigationRootPage extends StatelessWidget {
  final RootController controller;

  const BottomNavigationRootPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.page,
      builder: (context, page, _) => BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondary,
        currentIndex: page,
        onTap: (value) {
          controller.changePage(index: value);

          controller.pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: FontAwesomeIcon(
                fontAwesomeIcon: FontAwesomeIcons.house,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: FontAwesomeIcon(
                fontAwesomeIcon: FontAwesomeIcons.userAstronaut,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
