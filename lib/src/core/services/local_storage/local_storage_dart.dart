import 'package:result_dart/result_dart.dart';

abstract interface class ILocalStorage {
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required dynamic value});
  AsyncResult<SuccessReadData, FailureReadData> read({required String key});
  AsyncResult<SuccessDeleteAll, FailureDeleteAll> deleteAll();
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

final class SuccessDeleteAll {
  bool isDeleted = false;

  SuccessDeleteAll({required this.isDeleted});
}

final class FailureDeleteAll {
  String message;

  FailureDeleteAll({required this.message});
}
