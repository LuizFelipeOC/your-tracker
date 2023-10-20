import 'package:flutter/material.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/data/repositories/search_packages/search_packages_repository.dart';

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

abstract interface class SearchPackagesState {}

final class IdleSearchPackagesState extends SearchPackagesState {}

final class LoadingSearchPackagesState extends SearchPackagesState {}

final class LoadedSearchPackagesState extends SearchPackagesState {
  final PackagesModel packagesModel;

  LoadedSearchPackagesState({required this.packagesModel});
}

final class ErrorSearchPackagesState extends SearchPackagesState {}
