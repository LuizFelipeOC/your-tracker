import 'package:flutter/material.dart';

import '../../data/repositories/welcome_repository.dart';
import '../states/start_now_state.dart';

class WelcomeController extends ValueNotifier<StartNowState> {
  final WelcomeRepository welcomeRepository;

  WelcomeController({
    required this.welcomeRepository,
  }) : super(IdleStartNowState());

  void _emit({required StartNowState state}) => value = state;

  Future<void> startNow() async {
    _emit(state: LoadingNowState());

    final result = await welcomeRepository.startNow();

    result.fold(
      (success) => _emit(state: LoadedNowState()),
      (failure) => _emit(state: ErrorNowState()),
    );
  }
}
