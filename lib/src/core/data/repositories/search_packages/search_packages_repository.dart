import 'package:result_dart/result_dart.dart';

import '../../../services/http/http.dart';
import '../../models/packages_model.dart';
import 'packages_interface.dart';

class SearchPackagesRepository implements IPackges {
  final IHttpService http;

  SearchPackagesRepository({required this.http});

  @override
  AsyncResult<SuccessPackages, FailurePackages> get({required String packCode}) async {
    String message = '';
    late PackagesModel packages;

    final result = await http.get(path: packCode);

    if (result.isError()) {
      result.onFailure((failure) {
        message = failure.message;
      });

      return Failure(FailurePackages(message: message));
    }

    result.onSuccess((success) {
      packages = _transformPackagesList(data: success.data);
    });

    return Success(SuccessPackages(packages: packages));
  }

  PackagesModel _transformPackagesList({required data}) {
    final tranformMap = (data as Map<String, dynamic>);

    final transformInObject = PackagesModel.fromMap(tranformMap);
    return transformInObject;
  }
}
