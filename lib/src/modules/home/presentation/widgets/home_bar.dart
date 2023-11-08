import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBarWidget extends StatelessWidget {
  const HomeBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          text: AppLocalizations.of(context)!.firstWelcomeText,
          style: Theme.of(context).textTheme.headlineSmall,
          children: <TextSpan>[
            TextSpan(
              text: AppLocalizations.of(context)!.secondWelcomeText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
