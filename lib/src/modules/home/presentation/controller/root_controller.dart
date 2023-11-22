import 'package:flutter/material.dart';

class RootController {
  PageController pageController = PageController();

  ValueNotifier<int> page = ValueNotifier(0);

  void changePage({required int index}) {
    page.value = index;
  }
}
