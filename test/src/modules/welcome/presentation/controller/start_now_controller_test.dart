import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/src/modules/welcome/data/repositories/welcome_repository.dart';
import 'package:your_tracker/src/modules/welcome/data/repositories/welcome_results/welcome_results.dart';
import 'package:your_tracker/src/modules/welcome/presentation/controller/start_now_controller.dart';
import 'package:your_tracker/src/modules/welcome/presentation/states/start_now_state.dart';

class WelcomeRepositoryMck extends Mock implements WelcomeRepository {}

void main() {
  late StartNowController controller;
  late WelcomeRepository repository;

  setUp(() {
    repository = WelcomeRepositoryMck();
    controller = StartNowController(welcomeRepository: repository);
  });
  test('init state how idle start now', () async {
    expect(controller.value, isA<IdleStartNowState>());
  });

  test('save finish with success', () async {
    when(() => repository.startNow()).thenAnswer((_) async => Success(SuccessStartNow()));

    await controller.startNow();

    expect(controller.value, isA<LoadedNowState>());
  });
}
