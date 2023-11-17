import 'package:flutter/material.dart';

class AnimationEntranceController extends ChangeNotifier {
  bool isFirstAnimation = false;
  bool isSecondAnimation = false;
  bool isThirdAnimation = false;

  Future<void> firstAnimationEntrance() async {
    await Future.delayed(const Duration(milliseconds: 800));

    isFirstAnimation = true;
    isSecondAnimation = true;
    isThirdAnimation = true;

    notifyListeners();
  }
}
