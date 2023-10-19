import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_images.dart';
import '../../../../core/widgets/lotties_widgets/lottie_assets.dart';
import '../controller/search_packages_controller.dart';

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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items.status,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.packagesModel.eventos[index].subStatus?.length,
                                itemBuilder: (ctx, idx) {
                                  final subEvents = state.packagesModel.eventos[index].subStatus?[idx];

                                  return Text(
                                    subEvents.toString().replaceAll('[', '').replaceAll(']', ''),
                                    style: Theme.of(context).textTheme.labelMedium,
                                  );
                                },
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '${items.data}  ${items.hora}',
                                  style: Theme.of(context).textTheme.labelMedium,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              if (state is LoadingSearchPackagesState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LottieAssetsWidget(
                        pathAnimation: AppImage.laoding,
                        width: MediaQuery.of(context).size.width * .7,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          AppLocalizations.of(context)!.searchingPackage,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              }

              if (state is ErrorSearchPackagesState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text.rich(
                      TextSpan(
                        text: AppLocalizations.of(context)!.errorGetPackage,
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.seeErrorMotives,
                            style: Theme.of(context).textTheme.labelLarge,
                            recognizer: TapGestureRecognizer()..onTap = () => {},
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        )
      ],
    );
  }
}
