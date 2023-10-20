import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_images.dart';
import '../widgets/modal_seach_packages.dart';

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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.subTitleWelcomeText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      onPressed: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          isDismissible: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (ctx) => const ModalSearchPackges(),
                        );
                      },
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
