import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/src/core/services/local_storage/flutter_secure_storage.dart';
import 'package:your_tracker/src/core/services/local_storage/results/local_storage_results.dart';
import 'package:your_tracker/src/modules/welcome/data/repositories/welcome_repository.dart';

class FlutterSecureStorageMockLibary extends Mock implements FlutterSecureStorage {}

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorageService {}

void main() {
  late FlutterSecureStorageService localStorage;
  late WelcomeRepository repository;

  String start = 'start';
  String value = 'true';

  setUpAll(() {
    localStorage = FlutterSecureStorageMock();
    repository = WelcomeRepository(localStorage: localStorage);
  });

  test('Should test case have success in save value', () async {
    when(() => localStorage.save(key: start, value: value)).thenAnswer((_) async => Success(SuccessSaveData()));

    final result = await repository.startNow();

    expect(result.isSuccess(), isTrue);
  });

  test('Should test case have error in save value', () async {
    when(() => localStorage.save(key: start, value: value)).thenAnswer((_) async => Failure(FailureSaveData()));

    final result = await repository.startNow();

    expect(result.isError(), isTrue);
  });
}
