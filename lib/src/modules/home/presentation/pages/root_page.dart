import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/app_colors.dart';
import '../components/root/bottom_navigation_root.dart';
import '../controller/root_controller.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final controller = Modular.get<RootController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) => controller.changePage(index: index),
        physics: const BouncingScrollPhysics(),
        children: [
          const HomePage(),
          Container(color: AppColors.secondary),
        ],
      ),
      bottomNavigationBar: BottomNavigationRootPage(controller: controller),
    );
  }
}
