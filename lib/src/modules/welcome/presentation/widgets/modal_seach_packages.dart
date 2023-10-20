import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_colors.dart';
import '../controller/search_packages_controller.dart';
import 'card_tracking_packages.dart';
import 'erros_searchs_packages/error_search_packages_informations.dart';
import 'loading_search_packages.dart';

class ModalSearchPackges extends StatefulWidget {
  const ModalSearchPackges({
    super.key,
  });

  @override
  State<ModalSearchPackges> createState() => _ModalSearchPackgesState();
}

class _ModalSearchPackgesState extends State<ModalSearchPackges> {
  final searchPackagesStore = Modular.get<SearchPackagesController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  AppLocalizations.of(context)!.simpleSearch,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              InkWell(
                overlayColor: MaterialStatePropertyAll(AppColors.grey.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Modular.to.pop();
                  searchPackagesStore.resetState();
                },
                child: const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLength: 13,
                  controller: searchPackagesStore.trackCode,
                  style: Theme.of(context).textTheme.labelLarge,
                  cursorColor: AppColors.secondaryColor,
                  onChanged: (value) async {
                    if (value.length >= 13) {
                      await searchPackagesStore.searchPackage();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.trackingCode,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () async => await searchPackagesStore.searchPackage(),
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: searchPackagesStore,
            builder: (ctx, state, _) {
              if (state is LoadedSearchPackagesState) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.packagesModel.eventos.length,
                  itemBuilder: (context, index) {
                    final items = state.packagesModel.eventos[index];

                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: CardTrackingPackages(
                        items: items,
                      ),
                    );
                  },
                );
              }

              if (state is LoadingSearchPackagesState) {
                return const LoadingSearchPackages();
              }

              if (state is ErrorSearchPackagesState) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ErrorSearchPackageInformations(),
                );
              }

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.idleTrackerState,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
