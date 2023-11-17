import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_colors.dart';
import '../controller/home_controller.dart';

class HomeBarWidget extends StatelessWidget {
  final HomeController controller;
  final GlobalKey<ScaffoldState> scaffolKey;

  const HomeBarWidget({super.key, required this.controller, required this.scaffolKey});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.animationFadeInAppBar,
      builder: (ctx, animation, _) => Container(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedCrossFade(
              firstChild: Text.rich(
                TextSpan(
                  text: AppLocalizations.of(context)!.firstWelcomeText,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.white,
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLocalizations.of(context)!.secondWelcomeText,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            letterSpacing: 2,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              secondChild: Container(
                color: AppColors.green,
              ),
              sizeCurve: Curves.linearToEaseOut,
              crossFadeState: animation ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 800),
            ),
            GestureDetector(
              onTap: () => scaffolKey.currentState!.openEndDrawer(),
              child: Icon(
                Icons.menu,
                size: 46,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
