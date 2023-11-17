import 'package:flutter/material.dart';

import '../../data/models/packages_model.dart';
import '../../data/repositories/search_packages/search_packages_repository.dart';
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

  Future<void> favoritePackages({required PackagesModel package}) async {
    _emit(state: LoadingFavoriteState());

    await Future.delayed(const Duration(seconds: 1));

    final result = await searchRepository.favorite(package: package);

    result.onSuccess((success) {
      _emit(state: SuccessFavoriteState(package: package));
    });

    result.onFailure((failure) {
      _emit(state: ErrorFavoriteState(message: failure.message));
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
