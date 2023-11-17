import 'package:flutter/material.dart';

class ChipsController extends ChangeNotifier {
  String choise = '';

  void selectChips({required value}) {
    choise = value;
    notifyListeners();
  }
}
