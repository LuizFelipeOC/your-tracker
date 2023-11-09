import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/src/modules/search_packages/data/models/packages_model.dart';
import 'package:your_tracker/src/modules/search_packages/data/repositories/search_packages/search_packages_repository.dart';
import 'package:your_tracker/src/core/services/http/http.dart';
import 'package:your_tracker/src/core/services/http/uno.dart';
import 'package:your_tracker/src/core/services/local_storage/flutter_secure_storage.dart';
import 'package:your_tracker/src/core/services/local_storage/results/local_storage_results.dart';

class UnoServiceMock extends Mock implements UnoService {}

class SecureCacheMock extends Mock implements FlutterSecureStorageService {}

void main() {
  late UnoService unoService;
  late FlutterSecureStorageService localStorage;
  late SearchPackagesRepository repository;

  setUp(() {
    unoService = UnoServiceMock();
    localStorage = SecureCacheMock();
    repository = SearchPackagesRepository(http: unoService, localStorage: localStorage);
  });

  group('Should test all success cases ', () {
    test('if events list have items', () async {
      when(() => unoService.get(path: '')).thenAnswer((_) async => Success(SuccessConnection(data: responseEvents)));

      final sut = await repository.get(packCode: '');

      expect(sut.isSuccess(), isTrue);

      sut.onSuccess((success) {
        expect(success.packages.eventos.length, 2);
      });
    });

    test('if events list is empty', () async {
      when(() => unoService.get(path: '')).thenAnswer((_) async => Success(SuccessConnection(data: responseEventsEmpty)));

      final sut = await repository.get(packCode: '');

      expect(sut.isSuccess(), isTrue);

      sut.onSuccess((success) {
        expect(success.packages.eventos, isEmpty);
      });
    });
  });

  group('Should test the errors', () {
    test('if unauthorized access', () async {
      when(() => unoService.get(path: '')).thenAnswer((_) async => Failure(FailureConnection(message: 'HTML RESPONSE', statusCode: 401)));

      final sut = await repository.get(packCode: '');

      expect(sut.isError(), isTrue);

      sut.onFailure((failure) {
        expect(failure.message, 'Unauthorized');
      });
    });

    test('if internal any excpetion ', () async {
      when(() => unoService.get(path: '')).thenAnswer((_) async => Failure(FailureConnection(message: 'Any error', statusCode: 0)));

      final sut = await repository.get(packCode: '');

      expect(sut.isError(), isTrue);

      sut.onFailure((failure) {
        expect(failure.message, 'Any error');
      });
    });
  });

  group('Should teste favorite package', () {
    final model = PackagesModel.fromMap(responseEvents);
    final model2 = PackagesModel.fromMap(newResponseEvents);
    final mountObject = model.toMap();
    final mountObject2 = model2.toMap();

    final List<Map<String, dynamic>> listObject = [mountObject];
    List<Map<String, dynamic>> listTwoObject = [mountObject, mountObject2];

    test('when cache is empty', () async {
      when(() => localStorage.read(key: 'favorite_packages')).thenAnswer(
        (_) async => Failure(
          FailureReadData(message: 'This input is empty or key: favorite_packages dont exist'),
        ),
      );

      when(() => localStorage.save(key: 'favorite_packages', value: jsonEncode(listObject))).thenAnswer(
        (_) async => Success(SuccessSaveData()),
      );

      final result = await repository.favorite(package: model);

      expect(result.isSuccess(), isTrue);

      result.onSuccess((success) {
        expect(success.list.length, 1);
      });
    });

    test('when cache is value', () async {
      final model = PackagesModel.fromMap(newResponseEvents);

      when(() => localStorage.read(key: 'favorite_packages')).thenAnswer(
        (_) async => Success(
          SuccessReadData(data: responseEventsString),
        ),
      );

      when(() => localStorage.save(key: 'favorite_packages', value: jsonEncode(listTwoObject))).thenAnswer(
        (_) async => Success(SuccessSaveData()),
      );

      final result = await repository.favorite(package: model);

      expect(result.isSuccess(), isTrue);

      result.onSuccess((success) {
        expect(success.list.length, 2);
      });
    });

    test('when try save duplicate tracking code', () async {
      final model = PackagesModel.fromMap(responseEvents);

      when(() => localStorage.read(key: 'favorite_packages')).thenAnswer(
        (_) async => Success(
          SuccessReadData(data: responseEventsString),
        ),
      );

      when(() => localStorage.save(key: 'favorite_packages', value: jsonEncode(listTwoObject))).thenAnswer(
        (_) async => Success(SuccessSaveData()),
      );

      final result = await repository.favorite(package: model);

      expect(result.isSuccess(), isFalse);

      result.onFailure((failure) {
        expect(failure.message, 'Already exist track code');
      });
    });
  });

  test('should test success update list when have new events', () async {
    final model = PackagesModel.fromMap(responseEventsEmpty);
    List<Map<String, dynamic>> listTwoObject = [model.toMap()];

    when(() => localStorage.read(key: 'favorite_packages')).thenAnswer(
      (_) async => Success(
        SuccessReadData(data: responseEventsString),
      ),
    );

    when(() => localStorage.save(key: 'favorite_packages', value: jsonEncode(listTwoObject.toString()))).thenAnswer(
      (_) async => Success(SuccessSaveData()),
    );

    final sut = await repository.update(package: model);

    expect(sut.isSuccess(), true);

    sut.onSuccess((success) {
      expect(success.list.length, 1);
    });
  });
}

const responseEvents = {
  "codigo": "NL717798416BR",
  "host": "yi",
  "eventos": [
    {
      "data": "08/08/2023",
      "hora": "11:35:24",
      "local": "VARZEA GRANDE - MT",
      "status": "Objeto entregue ao destinatário",
      "subStatus": [""]
    },
    {
      "data": "08/08/2023",
      "hora": "11:34:57",
      "local": "VARZEA GRANDE - MT",
      "status": "Objeto saiu para entrega ao destinatário",
      "subStatus": [""]
    }
  ]
};

const newResponseEvents = {
  "codigo": "NL717798418BR",
  "host": "yi",
  "eventos": [
    {
      "data": "08/08/2023",
      "hora": "11:35:24",
      "local": "VARZEA GRANDE - MT",
      "status": "Objeto entregue ao destinatário",
      "subStatus": [""]
    },
    {
      "data": "08/08/2023",
      "hora": "11:34:57",
      "local": "VARZEA GRANDE - MT",
      "status": "Objeto saiu para entrega ao destinatário",
      "subStatus": [""]
    }
  ]
};

const responseEventsString = '''
[{"codigo":"NL717798416BR","eventos":[{"data":"08/08/2023","hora":"11:35:24","local":"VARZEA GRANDE - MT","status":"Objeto entregue ao destinatário","subStatus":[""]},{"data":"08/08/2023","hora":"11:34:57","local":"VARZEA GRANDE - MT","status":"Objeto saiu para entrega ao destinatário","subStatus":[""]}]}]
''';

const responseEventsEmpty = {"codigo": "NL717798416BR", "host": "yi", "eventos": []};
