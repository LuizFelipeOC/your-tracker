import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';
import 'package:your_tracker/src/core/services/uno/uno_service.dart';

class UnoSpy extends Mock implements Uno {}

void main() {
  late Uno uno;
  late UnoService unoService;

  Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  setUp(() {
    uno = UnoSpy();
    unoService = UnoService(uno: uno);
  });

  group('Should test GET methods:', () {
    final url = faker.internet.httpUrl();
    test('when occur successfull in request ', () async {
      when(() => uno.get(url.toString(), params: {}, headers: header)).thenAnswer(
        (_) async => Response(
          headers: {},
          request: Request(uri: Uri.parse(url.toString()), method: 'GET ', headers: {}, timeout: const Duration(seconds: 30), responseType: ResponseType.json),
          status: 200,
          data: exampleData,
        ),
      );

      final sut = await unoService.get(url: url.toString(), params: {});

      expect(sut.isSuccess(), isTrue);

      sut.onSuccess((success) {
        expect(success.response, isNotEmpty);
        expect(success.response, isA<Map<String, dynamic>>());
      });
    });

    test('when occur SocketExcpetion', () async {
      when(() => uno.get(url.toString(), params: {}, headers: header)).thenThrow(
        const SocketException('lookup'),
      );

      final sut = await unoService.get(url: url, params: {});

      expect(sut.isError(), isTrue);

      sut.onFailure((failure) {
        expect(failure.message.contains('Occur SocketError with the message: lookup'), isTrue);
      });
    });

    test('when occur HttpException', () async {
      when(() => uno.get(url.toString(), params: {}, headers: header)).thenThrow(
        const HttpException('any http exception'),
      );

      final sut = await unoService.get(url: url, params: {});

      expect(sut.isError(), isTrue);

      sut.onFailure((failure) {
        expect(failure.message.contains('Occur HttpError with the message: any http exception'), isTrue);
      });
    });

    test('when occur UnoError', () async {
      when(() => uno.get(url.toString(), params: {}, headers: header)).thenThrow(
        UnoError(
          'Intenral error server',
          response: Response(
            headers: {},
            request: Request(
              headers: {},
              uri: Uri.parse(url.toString()),
              method: 'GET',
              timeout: const Duration(seconds: 30),
            ),
            status: 500,
            data: errorResponseData,
          ),
        ),
      );

      final sut = await unoService.get(url: url, params: {});

      expect(sut.isError(), isTrue);

      sut.onFailure((failure) {
        expect(failure.message.isNotEmpty, isTrue);
        expect(failure.message.contains('500'), isTrue);
      });
    });
  });
}

const exampleData = {
  "example": "data response",
  "example2": 2,
  "example3": true,
};

const errorResponseData = {
  "message": "error response",
};
