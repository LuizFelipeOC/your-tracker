import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';
import 'package:your_tracker/src/core/services/http/uno.dart';
import 'package:your_tracker/src/core/utils/get_url_utils.dart';

class UnoMock extends Mock implements Uno {}

void main() {
  late Uno unoMock;
  late UnoService uno;

  setUp(() {
    unoMock = UnoMock();
    uno = UnoService(uno: unoMock);
  });

  group('Should test get method', () {
    final path = GetUrlUtils().url;

    Map<String, String> headers = {};

    test('case connection is successful', () async {
      when(() => unoMock.get(path, headers: headers)).thenAnswer(
        (_) async => Response(
          headers: headers,
          request: Request(
            uri: Uri.parse(path),
            method: 'GET',
            headers: headers,
            timeout: const Duration(seconds: 30),
          ),
          status: 200,
          data: reponseSuccess,
        ),
      );

      final sut = await uno.get();

      expect(sut.isSuccess(), isTrue);

      sut.onSuccess((success) {
        expect(success.data, isNotEmpty);
      });
    });

    group('case connection contains error:', () {
      test('Unauthorized', () async {
        when(() => unoMock.get(path, headers: headers)).thenThrow(
          UnoError(
            'Unauthorized',
            response: Response(
              headers: headers,
              request: Request(uri: Uri.parse(path), method: 'GET', headers: headers, timeout: const Duration(seconds: 30)),
              status: 401,
              data: reponseSuccess,
            ),
          ),
        );
        final sut = await uno.get();

        expect(sut.isError(), isTrue);

        sut.onFailure((failure) {
          expect(failure.message, 'Unauthorized');
          expect(failure.statusCode, 401);
        });
      });
    });
  });
}

const reponseSuccess = '''
  {
   "codigo": ""
  }
''';

const reponseUnauthorized = '''
  {
   "message": "Unauthorized"
  }
''';
