import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/src/core/data/repositories/search_packages/search_packages_repository.dart';
import 'package:your_tracker/src/core/services/http/http.dart';
import 'package:your_tracker/src/core/services/http/uno.dart';

class UnoServiceMock extends Mock implements UnoService {}

void main() {
  late UnoService unoService;
  late SearchPackagesRepository repository;

  setUp(() {
    unoService = UnoServiceMock();
    repository = SearchPackagesRepository(http: unoService);
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

const responseEventsEmpty = {"codigo": "NL717798416BR", "host": "yi", "eventos": []};
