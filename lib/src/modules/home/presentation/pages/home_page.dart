import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_images.dart';
import '../../../welcome/presentation/widgets/modal_seach_packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screen.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.sadFace,
                        color: AppColors.primaryColor,
                        width: screen.width * .15,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Você ainda não adicionou nenhum rastreio!',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton.extended(
          onPressed: () async {
            final object = await showModalBottomSheet<PackagesModel?>(
              context: context,
              isDismissible: false,
              isScrollControlled: true,
              useSafeArea: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              builder: (_) => const ModalSearchPackges(),
            );

            if (object == null) {
              return;
            }
          },
          label: const Text('ADD NEW PACKAGE'),
        ),
      ),
    );
  }
}
