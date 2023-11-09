import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/controller/search_packages_controller.dart';
import '../../../../core/controller/states/search_packages_states.dart';
import '../../../../core/widgets/modal_search_packages/card_tracking_packages.dart';
import '../../../../core/widgets/modal_search_packages/erros_searchs_packages/error_search_packages_informations.dart';
import '../../../../core/widgets/modal_search_packages/states_widgets/loading_search_packages.dart';

class ListTrackingPackagesWidget extends StatelessWidget {
  const ListTrackingPackagesWidget({
    super.key,
    required this.searchController,
  });

  final SearchPackagesController searchController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchController,
      builder: (ctx, state, _) {
        if (state is LoadingSearchPackagesState) {
          return Center(
            child: LoadingSearchPackages(
              title: AppLocalizations.of(context)!.loadingMyPackages,
            ),
          );
        }

        if (state is LoadedSearchPackagesState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.packagesModel.eventos.length,
            itemBuilder: (ctx, index) {
              final items = state.packagesModel.eventos[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: CardTrackingPackages(
                  items: items,
                ),
              );
            },
          );
        }

        if (state is ErrorSearchPackagesState) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ErrorSearchPackageInformations(),
          );
        }

        return Container();
      },
    );
  }
}
