import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/animation_entrace_controller.dart';

class WelcomePageHeader extends StatefulWidget {
  const WelcomePageHeader({
    super.key,
  });

  @override
  State<WelcomePageHeader> createState() => _WelcomePageHeaderState();
}

class _WelcomePageHeaderState extends State<WelcomePageHeader> {
  final _animationController = Modular.get<AnimationEntranceController>();

  @override
  void initState() {
    _animationController.firstAnimationEntrance();

    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                ),
            text: AppLocalizations.of(context)!.firstWelcomeText,
            children: [
              TextSpan(
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 30,
                    ),
                text: AppLocalizations.of(context)!.secondWelcomeText,
              )
            ],
          ),
        ),
      ),
      crossFadeState: _animationController.isFirstAnimation ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 900),
      sizeCurve: Curves.bounceIn,
    );
  }
}
