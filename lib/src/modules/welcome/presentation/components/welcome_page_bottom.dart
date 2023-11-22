import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/animation_entrace_controller.dart';

class WelcomePageBottom extends StatefulWidget {
  const WelcomePageBottom({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  State<WelcomePageBottom> createState() => _WelcomePageBottomState();
}

class _WelcomePageBottomState extends State<WelcomePageBottom> {
  final _animationEntrance = Modular.get<AnimationEntranceController>();

  @override
  void initState() {
    _animationEntrance.firstAnimationEntrance();

    _animationEntrance.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: Container(
        padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width: widget.screen.width,
              child: ElevatedButton(
                onPressed: () => Modular.to.pushReplacementNamed('/home/'),
                child: Text(
                  AppLocalizations.of(context)!.startNowButtonText.toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.orText),
            TextButton(
              onPressed: () => Modular.to.pushNamed('/search-packages/'),
              child: Text(AppLocalizations.of(context)!.fastSearchText.toUpperCase()),
            )
          ],
        ),
      ),
      crossFadeState: _animationEntrance.isThirdAnimation ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(seconds: 2),
      sizeCurve: Curves.bounceIn,
    );
  }
}
