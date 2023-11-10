import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../controller/drawer_controller.dart';
import 'home_drawer_header.dart';
import 'home_drawer_options.dart';

class HomeDrawerWidget extends StatelessWidget {
  final HomeDrawerController controller = HomeDrawerController();

  HomeDrawerWidget({
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.routes.length,
              itemBuilder: (ctx, index) {
                final options = controller.routes[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: HomeDrawerOptions(
                    routes: options,
                    icons: controller.defineIcon[options.title]!,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.grey,
                ),
                child: Text(
                  'SAIR DA CONTA',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.red,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                onPressed: () => {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
