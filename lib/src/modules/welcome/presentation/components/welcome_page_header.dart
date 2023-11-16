import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_colors.dart';

class WelcomePageHeader extends StatelessWidget {
  const WelcomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
          text: AppLocalizations.of(context)!.firstWelcomeText,
          children: [
            TextSpan(
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 30,
                  ),
              text: AppLocalizations.of(context)!.secondWelcomeText,
            )
          ],
        ),
      ),
    );
  }
}
