import 'package:flutter/material.dart';

import '../../../search_packages/data/models/packages_model.dart';
import 'states/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  ValueNotifier<List<PackagesModel>> reactiveList = ValueNotifier([]);
  ValueNotifier<bool> animationFadeInAppBar = ValueNotifier(false);

  HomeController() : super(IdleHomeState());

  Future<void> getAllFavoritePackages() async {
    _emitState(state: LoadingHomeState());

    await Future.delayed(const Duration(seconds: 1));

    _emitState(state: EmptyHomeState());
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
