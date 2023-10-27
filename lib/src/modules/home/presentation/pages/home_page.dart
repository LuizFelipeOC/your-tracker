import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:your_tracker/src/core/themes/app_colors.dart';
import 'package:your_tracker/src/core/widgets/modal_search_packages/states_widgets/loading_search_packages.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/widgets/modal_search_packages/modal_search_packages.dart';
import '../controller/home_controller.dart';
import '../widgets/simple_card_tracking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = Modular.get<HomeController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeStore.getAllFavoritePackages();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screen.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.firstWelcomeText,
                    style: Theme.of(context).textTheme.headlineSmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)!.secondWelcomeText,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: homeStore,
                  builder: (ctx, state, _) {
                    if (state is LoadingHomeState) {
                      return const Center(
                        child: LoadingSearchPackages(
                          title: 'Buscando seus pacotes',
                        ),
                      );
                    }

                    if (state is ErrorHomeState) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ocorreu um erro ao tentar buscar os pacotes, tente novamente mais tarde',
                              style: Theme.of(context).textTheme.headlineMedium,
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
                                  'Você ainda não adicionou nenhum item na lista ',
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
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton.extended(
          onPressed: () async {
            final object = await showModalBottomSheet<PackagesModel?>(
              context: context,
              isDismissible: false,
              isScrollControlled: true,
              useSafeArea: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              builder: (_) => const ModalSearchPackges(isStarnedNow: true),
            );

            if (object == null) {
              return;
            }

            homeStore.addPackageInList(packages: object);
          },
          label: const Text('ADD NEW PACKAGE'),
        ),
      ),
    );
  }
}
