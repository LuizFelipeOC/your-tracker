import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/app_images.dart';
import '../controller/animation_entrace_controller.dart';

class WelcomePageMiddle extends StatefulWidget {
  const WelcomePageMiddle({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  State<WelcomePageMiddle> createState() => _WelcomePageMiddleState();
}

class _WelcomePageMiddleState extends State<WelcomePageMiddle> {
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
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                AppImgaes.trackingImage,
                width: widget.screen.width * .5,
              ),
              const SizedBox(height: 30),
              Text(
                AppLocalizations.of(context)!.subTitleWelcomeText,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ),
      ),
      crossFadeState: _animationController.isSecondAnimation ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(seconds: 1),
      sizeCurve: Curves.bounceIn,
    );
  }
}
