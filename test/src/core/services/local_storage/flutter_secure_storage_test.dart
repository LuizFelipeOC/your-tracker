import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_tracker/src/core/services/local_storage/flutter_secure_storage.dart';

class FlutterLocalStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late FlutterSecureStorage secureStorage;
  late FlutterSecureStorageService service;

  String keyValue = 'keyValue';
  String value = 'exampleValue';

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({'keyValue': 'value'});

    secureStorage = FlutterLocalStorageMock();
    service = FlutterSecureStorageService();
  });

  group('Should test save method, case ocurr: ', () {
    test('success to save information', () async {
      when(() => secureStorage.write(key: keyValue, value: value)).thenAnswer((_) async {});

      final result = await service.save(key: keyValue, value: value);

      expect(result.isSuccess(), isTrue);
    });
  });

  group('Should test read method in', () {
    test('success to get information', () async {
      when(() => secureStorage.read(key: keyValue)).thenAnswer((_) async => 'value');

      final result = await service.read(key: keyValue);

      expect(result.isSuccess(), isTrue);
    });

    test('success to get information but empty value', () async {
      FlutterSecureStorage.setMockInitialValues({});

      when(() => secureStorage.read(key: keyValue)).thenAnswer((_) async => null);

      final result = await service.read(key: keyValue);

      expect(result.isError(), isTrue);

      result.onFailure((failure) {
        expect(failure.message, isNotEmpty);
        expect(failure.message, 'This input is empty or key: $keyValue dont exist');
      });
    });
  });
}
