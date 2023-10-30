import 'package:result_dart/result_dart.dart';

abstract interface class ILocalStorage {
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required dynamic value});
  AsyncResult<SuccessReadData, FailureReadData> read({required String key});
}

final class SuccessSaveData {}

final class FailureSaveData {}

final class SuccessReadData {
  Object data;

  SuccessReadData({required this.data});
}

final class FailureReadData {
  String message;

  FailureReadData({required this.message});
}
