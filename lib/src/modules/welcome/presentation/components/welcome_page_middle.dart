import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_images.dart';

class WelcomePageMiddle extends StatelessWidget {
  const WelcomePageMiddle({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: [
            Image.asset(
              AppImgaes.trackingImage,
              width: screen.width * .5,
            ),
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.subTitleWelcomeText,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
