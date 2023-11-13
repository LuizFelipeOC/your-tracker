import 'dart:io';

import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';

import 'http_interface.dart';
import 'results/http_results.dart';

class UnoService implements IHttpService {
  final Uno uno;

  UnoService({required this.uno});

  Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  AsyncResult<GetResultSuccess, GetResultError> get({required String url, required Map<String, String> params}) async {
    try {
      final response = await uno.get(
        url,
        params: params,
        headers: header,
        responseType: ResponseType.json,
      );

      return Success(GetResultSuccess(response: response.data));
    } on SocketException catch (err) {
      return Failure(GetResultError(message: 'Occur SocketError with the message: ${err.message} on address ${err.address}'));
    } on HttpException catch (err) {
      return Failure(GetResultError(message: 'Occur HttpError with the message: ${err.message} on uri ${err.uri}'));
    } on UnoError catch (err) {
      return Failure(GetResultError(message: 'Occur request error with ${err.message} with status code ${err.response?.status}'));
    } catch (e) {
      return Failure(GetResultError(message: 'Occur an error when try send of request'));
    }
  }
}
