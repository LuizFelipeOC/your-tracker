import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_images.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: screen.height,
          width: screen.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
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
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        AppImage.welcomeImage,
                        width: screen.width * .5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      AppLocalizations.of(context)!.subTitleWelcomeText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 46,
                      width: screen.width * .80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.welcomeFirstButton,
                          style: Theme.of(context).textTheme.bodyLarge,
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
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.simpleSearch,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
