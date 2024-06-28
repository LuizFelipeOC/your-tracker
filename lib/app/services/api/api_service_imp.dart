import 'dart:convert';
import 'dart:io';

import 'package:result_dart/result_dart.dart';
import 'package:http/http.dart' as http;

import '../../utils/env.dart';
import 'api_results.dart';

import 'api_service.dart';

class ApiServiceImp implements ApiService {
  late http.Client _client;

  Map<String, String> queryParameters = {};

  ApiServiceImp({required http.Client client}) {
    _client = client;
  }

  @override
  AsyncResult<SuccessApi, FailureApi> get({Map<String, String>? queryParams}) async {
    try {
      final response = await _client.get(Uri.parse('${Env().url}${queryParams!['codigo']}'));

      if (response.statusCode == 200) {
        final decoding = (jsonDecode(response.body) as Map<String, dynamic>);
        return Success(SuccessApi(data: decoding));
      }

      return Failure(FailureApi(message: response.body, statusCode: response.statusCode));
    } on FormatException catch (err) {
      return Failure(BadResponse(message: err.message));
    } on SocketException catch (err) {
      return Failure(ApiSocketExcpetion(message: err.message));
    } catch (_) {
      return Failure(FailureApi(message: _.toString()));
    }
  }
}
