import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_tracker/src/core/services/cache/cache_service.dart';

class SharedPrefencesSpy extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences sharedPreferencesSpy;
  late CacheService cacheService;

  setUp(() {
    SharedPreferences.setMockInitialValues({});

    sharedPreferencesSpy = SharedPrefencesSpy();
    cacheService = CacheService();
  });

  group('Should test save values with shared preferences:', () {
    test('test save string value', () async {
      when(() => sharedPreferencesSpy.setString('string', 'value')).thenAnswer((_) async => true);

      final sut = await cacheService.save(key: 'string', value: 'value');

      expect(sut.isSuccess(), isTrue);
    });

    test('test save double value', () async {
      when(() => sharedPreferencesSpy.setDouble('double', 0.0)).thenAnswer((_) async => true);

      final sut = await cacheService.save(key: 'double', value: 0.0);

      expect(sut.isSuccess(), isTrue);
    });

    test('test save int value', () async {
      when(() => sharedPreferencesSpy.setInt('int', 0)).thenAnswer((_) async => true);

      final sut = await cacheService.save(key: 'int', value: 0);

      expect(sut.isSuccess(), isTrue);
    });

    test('test save boolean value', () async {
      when(() => sharedPreferencesSpy.setBool('boolean', true)).thenAnswer((_) async => true);

      final sut = await cacheService.save(key: 'boolean', value: true);

      expect(sut.isSuccess(), isTrue);
    });

    test('test unavaible value trying saved', () async {
      final sut = await cacheService.save(key: 'undefined', value: null);

      expect(sut.isError(), isTrue);
    });
  });
}
