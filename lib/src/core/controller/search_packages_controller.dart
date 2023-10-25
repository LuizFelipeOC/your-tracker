import 'package:flutter/material.dart';

import '../data/repositories/search_packages/search_packages_repository.dart';
import 'states/search_packages_states.dart';

class SearchPackagesController extends ValueNotifier<SearchPackagesState> {
  final SearchPackagesRepository searchRepository;

  TextEditingController trackCode = TextEditingController(text: '');

  SearchPackagesController({required this.searchRepository}) : super(IdleSearchPackagesState());

  Future<void> searchPackage() async {
    _emit(state: LoadingSearchPackagesState());

    final result = await searchRepository.get(packCode: trackCode.text.trim());

    result.fold((success) {
      _emit(state: LoadedSearchPackagesState(packagesModel: success.packages));
    }, (failure) {
      _emit(state: ErrorSearchPackagesState());
    });
  }

  void resetState() {
    value = IdleSearchPackagesState();
    trackCode.clear();
  }

  void _emit({required SearchPackagesState state}) {
    value = state;
  }
}
