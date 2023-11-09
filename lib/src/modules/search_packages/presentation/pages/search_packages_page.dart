import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/controller/search_packages_controller.dart';
import '../../../../core/controller/states/search_packages_states.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/list_tracking_packages.dart';
import '../widgets/search_package_header.dart';

class SearchPackagesPage extends StatefulWidget {
  final bool isOnlyView;

  const SearchPackagesPage({
    Key? key,
    required this.isOnlyView,
  }) : super(key: key);

  @override
  State<SearchPackagesPage> createState() => _SearchPackagesPageState();
}

class _SearchPackagesPageState extends State<SearchPackagesPage> {
  final searchController = Modular.get<SearchPackagesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
            child: SearchPackageHeaderWidget(
              searchController: searchController,
            ),
          ),
          Expanded(
            child: ListTrackingPackagesWidget(searchController: searchController),
          )
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: searchController,
        builder: (ctx, state, _) {
          if (state is LoadedSearchPackagesState || !widget.isOnlyView) {
            return FloatingActionButton.extended(
              splashColor: AppColors.grey,
              onPressed: () => {},
              label: Text(AppLocalizations.of(context)!.favoriteYourPackage),
            );
          }

          return Container();
        },
      ),
    );
  }
}
