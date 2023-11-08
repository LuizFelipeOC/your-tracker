import 'package:flutter/material.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/data/repositories/search_packages/packages_interface.dart';
import 'states/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  final IPackges packges;

  ValueNotifier<List<PackagesModel>> reactiveList = ValueNotifier([]);
  ValueNotifier<bool> animationFadeInAppBar = ValueNotifier(false);

  HomeController({required this.packges}) : super(IdleHomeState());

  Future<void> getAllFavoritePackages() async {
    _emitState(state: LoadingHomeState());

    final result = await packges.getAllCachedPackages();

    await Future.delayed(const Duration(seconds: 1));

    result.fold((success) {
      reactiveList.value = success.list;

      _emitState(state: SuccessHomeState(list: success.list));
    }, (failure) {
      if (reactiveList.value.isEmpty) {
        return _emitState(state: EmptyHomeState());
      }

      _emitState(state: ErrorHomeState(message: failure.message));
    });
  }

  void addPackageInList({required PackagesModel packages}) async {
    _emitState(state: IdleHomeState());
    reactiveList.value.add(packages);

    _emitState(state: SuccessHomeState(list: reactiveList.value));
  }

  void animationAppBar() async {
    animationFadeInAppBar.value = true;
  }

  void _emitState({required HomeState state}) {
    value = state;
  }
}
