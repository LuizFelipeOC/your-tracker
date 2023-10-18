import 'dart:convert';

import 'package:result_dart/result_dart.dart';

abstract class IHttpService {
  AsyncResult<SuccessConnection, FailureConnection> get({required String path, required Map<String, String> headers});
}

final class SuccessConnection {
  dynamic data;

  SuccessConnection({required this.data});
}

class FailureConnection {
  int statusCode;
  String message;

  FailureConnection({required this.message, required this.statusCode}) {
    formattingMessage();
  }

  String formattingMessage() {
    if (statusCode == 401) {
      return message = 'Unauthorized';
    }

    if (statusCode != 0) {
      final decodingObject = (jsonDecode(message)) as Map<String, dynamic>;
      return message = decodingObject['message'];
    }

    return message;
  }
}
