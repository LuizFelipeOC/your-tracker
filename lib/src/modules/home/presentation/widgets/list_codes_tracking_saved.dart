import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/modal_search_packages/states_widgets/loading_search_packages.dart';
import '../controller/home_controller.dart';
import '../controller/states/home_state.dart';
import 'simple_card_tracking.dart';

class ListCodesTrackingSavedWidget extends StatelessWidget {
  const ListCodesTrackingSavedWidget({
    super.key,
    required this.homeStore,
  });

  final HomeController homeStore;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homeStore,
      builder: (ctx, state, _) {
        if (state is LoadingHomeState) {
          return Center(
            child: LoadingSearchPackages(
              title: AppLocalizations.of(context)!.loadingMyPackages,
            ),
          );
        }

        if (state is ErrorHomeState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.message == 'Dont have items in cahced' ? AppLocalizations.of(context)!.emptyHomeItems : AppLocalizations.of(context)!.errorHomeItems,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is SuccessHomeState) {
          if (state.list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.emptyHomeItems,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.primaryColor,
            onRefresh: () => homeStore.getAllFavoritePackages(),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.list.length,
              itemBuilder: (ctx, index) {
                final item = state.list[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: SimpleCardTracking(item: item),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
