import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/welcome_controller.dart';

class WelcomeBottomWidget extends StatelessWidget {
  const WelcomeBottomWidget({
    super.key,
    required this.screen,
    required WelcomeController welcomeController,
  }) : _welcomeController = welcomeController;

  final Size screen;
  final WelcomeController _welcomeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 56,
          width: screen.width * .80,
          child: ElevatedButton(
            onPressed: () => _welcomeController.startNow(),
            child: Text(
              AppLocalizations.of(context)!.welcomeFirstButton.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    letterSpacing: 2.0,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.or.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => Modular.to.pushNamed('/search-packages/', arguments: true),
          child: Text(
            AppLocalizations.of(context)!.simpleSearch.toUpperCase(),
            style: const TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
