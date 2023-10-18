import 'dart:io';

import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';

import '../../utils/get_url_utils.dart';
import 'http.dart';

class UnoService implements IHttpService {
  Uno uno;

  GetUrlUtils getUrlUtils = GetUrlUtils();

  UnoService({required this.uno});

  @override
  AsyncResult<SuccessConnection, FailureConnection> get({required String path, required Map<String, String> headers}) async {
    try {
      final response = await uno.get(getUrlUtils.url, headers: headers);

      return Success(SuccessConnection(data: response.data));
    } on HttpException catch (err) {
      return Failure(FailureConnection(message: err.message, statusCode: 0));
    } on SocketException catch (err) {
      return Failure(FailureConnection(message: err.message, statusCode: 0));
    } on UnoError catch (err) {
      return Failure(FailureConnection(message: err.message, statusCode: err.response!.status));
    } catch (_) {
      return Failure(FailureConnection(message: _.toString(), statusCode: 0));
    }
  }
}
