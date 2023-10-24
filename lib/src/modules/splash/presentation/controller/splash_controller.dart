import 'package:flutter/material.dart';

import '../../data/repositories/splash_repository.dart';
import '../states/splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final SplashRepository repository;

  SplashController({required this.repository}) : super(IdleSplashState());

  Future<void> verifyExistData() async {
    final result = await repository.getStartNow();

    result.fold((success) {
      _emit(state: SuccessSplashState());
    }, (failure) {
      _emit(state: ErrorSplashState());
    });
  }

  void _emit({required SplashState state}) {
    value = state;
  }
}
