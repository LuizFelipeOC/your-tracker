class SuccessApi {
  Map<String, dynamic>? data;

  SuccessApi({this.data});
}

class FailureApi {
  String? message;
  int? statusCode;

  FailureApi({this.message, this.statusCode});
}

class BadResponse extends FailureApi {
  BadResponse({super.message, super.statusCode});
}

class ApiSocketExcpetion extends FailureApi {
  ApiSocketExcpetion({super.message, super.statusCode});
}
