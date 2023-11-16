import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePageBottom extends StatelessWidget {
  const WelcomePageBottom({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: screen.width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.welcomeFirstButton.toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.or),
          TextButton(
            onPressed: () => Modular.to.pushNamed('/search-packages/'),
            child: Text(AppLocalizations.of(context)!.simpleSearch),
          )
        ],
      ),
    );
  }
}
