import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class CardSearchPackages extends StatelessWidget {
  const CardSearchPackages({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImgaes.boxImage,
                  width: screen.width * .1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Objeto Encaminhado',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'Local',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.secondary,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Data hora',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.secondary,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
