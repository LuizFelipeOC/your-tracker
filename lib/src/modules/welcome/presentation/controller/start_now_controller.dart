import 'package:flutter/material.dart';

import '../../data/repositories/welcome_repository.dart';
import '../states/start_now_state.dart';

class StartNowController extends ValueNotifier<StartNowState> {
  final WelcomeRepository welcomeRepository;

  StartNowController({required this.welcomeRepository}) : super(IdleStartNowState());

  Future<void> startNow() async {
    _emit(state: LoadingNowState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await welcomeRepository.startNow();

    if (result.isSuccess()) {
      _emit(state: LoadedNowState());
      return;
    }

    _emit(state: ErrorNowState());
  }

  void _emit({required StartNowState state}) {
    value = state;
  }
}
