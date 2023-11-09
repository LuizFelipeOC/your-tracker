import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_images.dart';

class WelcomeCenteredMessageWidget extends StatelessWidget {
  const WelcomeCenteredMessageWidget({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            AppImage.welcomeImage,
            width: screen.width * .45,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          AppLocalizations.of(context)!.subTitleWelcomeText.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.98,
              ),
        )
      ],
    );
  }
}
