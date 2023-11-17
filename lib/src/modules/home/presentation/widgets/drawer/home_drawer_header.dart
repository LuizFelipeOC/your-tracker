import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_images.dart';

class HomeDrawerHeader extends StatelessWidget {
  const HomeDrawerHeader({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      child: DrawerHeader(
        decoration: BoxDecoration(
          gradient: AppColors.linear,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screen.width),
                      child: Image.asset(
                        AppImage.cat,
                        width: screen.width * .3,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: AppColors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Luiz Felipe',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500,
                      ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
