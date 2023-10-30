import 'dart:convert';

import 'package:result_dart/result_dart.dart';

import '../../../services/http/http.dart';
import '../../../services/local_storage/local_storage_dart.dart';
import '../../models/packages_model.dart';
import 'packages_interface.dart';
import 'results/search_package_results.dart';

class SearchPackagesRepository implements IPackges {
  final IHttpService http;
  final ILocalStorage localStorage;

  List<PackagesModel> packages = <PackagesModel>[];
  List<Map<String, dynamic>> listOfObjects = [];

  bool haveErrorInSavement = false;

  SearchPackagesRepository({required this.http, required this.localStorage});

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

  @override
  AsyncResult<SuccessFavoritePackage, FailureFavoritePackage> favorite({required PackagesModel package}) async {
    try {
      final verifyPackagesCache = await localStorage.read(key: 'favorite_packages');

      if (verifyPackagesCache.isError()) {
        final mountObject = package.toMap();

        listOfObjects.add(mountObject);

        final moutendPakcage = PackagesModel.fromMap(mountObject);
        packages.add(moutendPakcage);

        await localStorage.save(key: 'favorite_packages', value: jsonEncode(listOfObjects));

        return Success(SuccessFavoritePackage(list: packages));
      }

      verifyPackagesCache.onSuccess((success) {
        final transformList = _transformCacheValue(data: success.data);

        final alreadyExist = transformList.indexWhere((e) => e.codigo == package.codigo);

        if (alreadyExist >= 0) {
          haveErrorInSavement = true;
          return;
        }

        transformList.add(package);
        packages.addAll(transformList);
        haveErrorInSavement = false;
      });

      if (haveErrorInSavement) {
        return Failure(FailureFavoritePackage(message: 'Already exist track code'));
      }

      for (var items in packages) {
        listOfObjects.add(items.toMap());
      }

      await localStorage.save(key: 'favorite_packages', value: jsonEncode(listOfObjects));
      return Success(SuccessFavoritePackage(list: packages));
    } catch (_) {
      return Failure(FailureFavoritePackage(message: 'Ocurr an exception when: ${_.toString()} in favorite package'));
    }
  }

  @override
  AsyncResult<SuccesseGetAllPackages, FailureeGetAllPackages> getAllCachedPackages() async {
    List<PackagesModel> list = [];

    final getAllPackagesCache = await localStorage.read(key: 'favorite_packages');

    if (getAllPackagesCache.isError()) {
      return Failure(FailureeGetAllPackages(message: 'Dont have items in cahced'));
    }

    getAllPackagesCache.onSuccess((success) {
      list = _transformCacheValue(data: success.data);
    });

    return Success(SuccesseGetAllPackages(list: list));
  }

  PackagesModel _transformPackagesList({required data}) {
    final transformInObject = PackagesModel.fromMap(data);
    return transformInObject;
  }

  List<PackagesModel> _transformCacheValue({required data}) {
    final decodingData = jsonDecode(data) as List<dynamic>;

    return decodingData.map((e) => PackagesModel.fromMap(e)).toList();
  }
}
