import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          text: AppLocalizations.of(context)!.firstWelcomeText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
          children: <TextSpan>[
            TextSpan(
              text: AppLocalizations.of(context)!.secondWelcomeText,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
