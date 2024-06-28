import 'package:flutter/widgets.dart';

import '../../data/model/package_model.dart';
import '../../data/repositories/search_packages/search_package_repository.dart';

enum SearchState { idle, laoding, success, error }

class SearchPackagesController extends ValueNotifier<SearchState> {
  late SearchPackageRepository _packageRepository;

  TextEditingController trackingCode = TextEditingController(text: '');

  late PackageModel packageModel;

  String errorMessage = '';

  SearchPackagesController({required SearchPackageRepository packageRepository}) : super(SearchState.idle) {
    _packageRepository = packageRepository;
  }

  Future<void> getPackage() async {
    value = SearchState.laoding;

    final result = await _packageRepository.get(code: trackingCode.text.trim());

    result.fold((onSuccess) {
      packageModel = onSuccess.package;
      value = SearchState.success;
    }, (onFailure) {
      if (onFailure.message == 'Unauthorized') {
        errorMessage = 'Pacote ainda não foi postado ou o tipo de envio não é publica, tente novamente mais tarde.';
        value = SearchState.error;
        return;
      }

      errorMessage = onFailure.message;
      value = SearchState.error;
    });
  }
}
