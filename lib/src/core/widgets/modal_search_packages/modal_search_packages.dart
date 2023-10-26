import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controller/search_packages_controller.dart';
import '../../controller/states/search_packages_states.dart';
import 'erros_searchs_packages/error_search_packages_informations.dart';
import '../../themes/app_colors.dart';
import 'card_tracking_packages.dart';
import 'states_widgets/favorited_message_packages.dart';
import 'states_widgets/loading_search_packages.dart';

class ModalSearchPackges extends StatefulWidget {
  final bool isStarnedNow;

  const ModalSearchPackges({
    super.key,
    required this.isStarnedNow,
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
                child: widget.isStarnedNow
                    ? Text(
                        AppLocalizations.of(context)!.searchingStartNowTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    : Text(
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
                      FocusScope.of(context).unfocus();
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
                  onPressed: () async => {
                    FocusScope.of(context).unfocus(),
                    await searchPackagesStore.searchPackage(),
                  },
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
              if (state is LoadingSearchPackagesState) {
                return LoadingSearchPackages(
                  title: AppLocalizations.of(context)!.searchingPackage,
                );
              }

              if (state is ErrorSearchPackagesState) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ErrorSearchPackageInformations(),
                );
              }
              if (state is LoadedSearchPackagesState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: state.packagesModel.eventos.length,
                        itemBuilder: (context, index) {
                          final items = state.packagesModel.eventos[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: CardTrackingPackages(
                              items: items,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                      child: TextButton(
                        onPressed: () {
                          Modular.to.pop(state.packagesModel);
                        },
                        child: FloatingActionButton.extended(
                          onPressed: () => searchPackagesStore.favoritePackages(package: state.packagesModel),
                          label: Text(AppLocalizations.of(context)!.favoriteYourPackage),
                          icon: const Icon(Icons.star),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (state is LoadingFavoriteState) {
                return const LoadingSearchPackages(
                  title: 'Salvando o pacote, aguarde um momento!',
                );
              }

              if (state is SuccessFavoriteState) {
                return FavoritedMessagePackage(
                  title: 'O pacote foi salvo com sucesso!',
                  iconColor: AppColors.green,
                  iconData: Icons.check_circle_rounded,
                  controller: searchPackagesStore,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              searchPackagesStore.value = IdleSearchPackagesState();
                            },
                            child: const Text('Continuar buscas'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalizations.of(context)!.or),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 46,
                          child: TextButton(
                            onPressed: () {
                              Modular.to.pop();
                              searchPackagesStore.resetState();
                            },
                            child: Text(
                              'Fechar',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is ErrorFavoriteState) {
                return FavoritedMessagePackage(
                  title: state.message == 'Already exist track code' ? 'Não pode salvar um pacote já salvo' : 'Ocorreu um erro ao salvar o pacote!',
                  iconColor: AppColors.red,
                  iconData: Icons.error_sharp,
                  controller: searchPackagesStore,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              searchPackagesStore.searchPackage();
                            },
                            child: const Text('Tentar novamente'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalizations.of(context)!.or),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 46,
                          child: TextButton(
                            onPressed: () {
                              Modular.to.pop();
                              searchPackagesStore.resetState();
                            },
                            child: Text(
                              'Fechar',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        ),
      ],
    );
  }
}
