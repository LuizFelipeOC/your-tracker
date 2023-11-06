import 'package:flutter/material.dart';

import '../../../../core/data/repositories/check_first_run_app/first_run_app_repository.dart';
import '../../data/repositories/splash_repository.dart';
import '../states/splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final SplashRepository repository;
  final CheckFirstRunApp checkFirstRunApp;

  SplashController({required this.repository, required this.checkFirstRunApp}) : super(IdleSplashState());

  Future<void> verifyExistData() async {
    await checkFirstRunApp.checkDevice();

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
