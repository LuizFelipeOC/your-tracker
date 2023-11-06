import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_tracker/src/core/services/local_storage/shared_preferences_service.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late SharedPreferences preferences;
  late SharedPrefenceService service;

  const key = 'dynamicKey';

  setUp(() {
    preferences = SharedPreferencesMock();
    service = SharedPrefenceService();

    SharedPreferences.setMockInitialValues({});
  });
  test('should teste case value is empty', () async {
    when(() => preferences.get(key)).thenAnswer((_) async => null);

    final result = await service.read(key: key);

    expect(result.isError(), isTrue);

    result.onFailure((failure) {
      expect(failure.message, 'Dont have value in key: $key');
    });
  });

  test('should teste case value is not empty', () async {
    SharedPreferences.setMockInitialValues({key: 'value'});

    when(() => preferences.get(key)).thenAnswer((_) async => 'value');

    final result = await service.read(key: key);

    expect(result.isSuccess(), isTrue);

    result.onSuccess((success) {
      expect(success.data, isA<String>());
      expect(success.data, 'value');
    });
  });
}
