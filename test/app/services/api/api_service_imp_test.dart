import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:http/http.dart' as http;
import 'package:your_tracker/app/services/api/api_results.dart';
import 'package:your_tracker/app/services/api/api_service_imp.dart';
import 'package:your_tracker/app/utils/env.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late ApiServiceImp apiServiceImp;

  setUpAll(() {
    client = ClientMock();
    apiServiceImp = ApiServiceImp(client: client);
  });

  tearDownAll(() {
    client = ClientMock();
    apiServiceImp = ApiServiceImp(client: client);
  });

  Map<String, String> queryParameters = {};

  test("Should test when response body d'nt json formatter", () async {
    when(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).thenAnswer((_) async {
      return http.Response('HTML RESPONSE', 200);
    });

    final response = await apiServiceImp.get();

    expect(response.isError(), isTrue);

    response.onFailure((onFailure) {
      expect(onFailure, isA<BadResponse>());
      expect(onFailure.message, 'Unexpected character');
    });

    verify(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).called(1);
  });

  test("Should test when response body as unauthorized", () async {
    when(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).thenAnswer((_) async {
      return http.Response('HTML RESPONSE', 401);
    });

    final response = await apiServiceImp.get();

    expect(response.isError(), isTrue);

    response.onFailure((onFailure) {
      expect(onFailure.message, 'HTML RESPONSE');
      expect(onFailure.statusCode, 401);
    });

    verify(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).called(1);
  });

  test("Should test when api request has socket excpetion", () async {
    when(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).thenThrow(SocketException(''));

    final response = await apiServiceImp.get();

    expect(response.isError(), isTrue);

    response.onFailure((onFailure) {
      expect(onFailure, isA<ApiSocketExcpetion>());
    });

    verify(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).called(1);
  });

  test("Should test when api request has excpetion", () async {
    when(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).thenThrow(Exception(''));

    final response = await apiServiceImp.get();

    expect(response.isError(), isTrue);

    response.onFailure((onFailure) {
      expect(onFailure, isA<FailureApi>());
    });

    verify(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).called(1);
  });

  test("Should test when response is correct", () async {
    when(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).thenAnswer((_) async {
      return http.Response('{}', 200);
    });

    final response = await apiServiceImp.get();

    expect(response.isSuccess(), isTrue);

    response.onSuccess((onSuccess) {
      expect(onSuccess.data, isA<Map<String, dynamic>>());
      expect(onSuccess.data?.isEmpty, isTrue);
    });

    verify(() => client.get(Uri.https(Env().url).replace(queryParameters: queryParameters))).called(1);
  });
}
