import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/src/core/services/local_storage/flutter_secure_storage.dart';
import 'package:your_tracker/src/core/services/local_storage/results/local_storage_results.dart';
import 'package:your_tracker/src/modules/splash/data/repositories/splash_repository.dart';

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorageService {}

void main() {
  late FlutterSecureStorageService storageService;
  late SplashRepository repository;

  const key = 'start';

  setUp(() {
    storageService = FlutterSecureStorageMock();
    repository = SplashRepository(storage: storageService);
  });

  group('Should test any options have success in get exist data info', () {
    test('when success have cache in start key', () async {
      when(() => storageService.read(key: key)).thenAnswer(
        (_) async => Success(SuccessReadData(data: 'value')),
      );

      final result = await repository.getStartNow();

      expect(result.isSuccess(), isTrue);

      result.onSuccess((success) {
        expect(success.message, isNotEmpty);
        expect(success.message, 'Have cached info in start now');
      });
    });
  });

  test('Should test case have any error or excpetions', () async {
    when(() => storageService.read(key: key)).thenAnswer(
      (_) async => Failure(FailureReadData(message: 'This input is empty or key: $key dont exist')),
    );

    final result = await repository.getStartNow();

    expect(result.isError(), isTrue);

    result.onFailure((failure) {
      expect(failure.message, isNotEmpty);
      expect(failure.message, 'Occur an error during verfiy cache info');
    });
  });
}
