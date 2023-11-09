import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/themes/app_images.dart';
import '../../../../core/widgets/modal_search_packages/modal_search_packages.dart';
import '../controller/welcome_controller.dart';
import '../states/start_now_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _welcomeController = Modular.get<WelcomeController>();

  @override
  void initState() {
    _welcomeController.addListener(() {
      if (_welcomeController.value is LoadedNowState) {
        Navigator.pushReplacementNamed(context, '/home/');
      }
    });

    super.initState();
  }

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
                ),
              ),
              Expanded(
                child: Column(
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
                ),
              ),
              Expanded(
                child: Column(
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
                      onPressed: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          isDismissible: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (ctx) => const ModalSearchPackges(
                            isStarnedNow: false,
                            isView: false,
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.simpleSearch.toUpperCase(),
                        style: const TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300,
                        ),
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
