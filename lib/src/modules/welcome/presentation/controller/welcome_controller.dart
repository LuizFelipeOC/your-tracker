import 'package:flutter/material.dart';

import '../../data/repositories/welcome_repository.dart';
import '../states/welcome_state.dart';

class WelcomeController extends ValueNotifier<WelcomeState> {
  final WelcomeRepository welcomeRepository;

  WelcomeController({
    required this.welcomeRepository,
  }) : super(IdleWelcomeState());

  void _emit({required WelcomeState state}) => value = state;

  Future<void> startNow() async {
    _emit(state: LoadingWelcomeState());

    final result = await welcomeRepository.startNow();

    result.fold(
      (success) => _emit(state: SuccessWelcomeState()),
      (failure) => _emit(state: ErrorNowState()),
    );
  }
}
