import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/widgets/modal_search_packages/modal_search_packages.dart';
import '../controller/home_controller.dart';
import '../widgets/home_bar.dart';
import '../widgets/list_codes_tracking_saved.dart';

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
              const HomeBarWidget(),
              Expanded(
                child: ListCodesTrackingSavedWidget(homeStore: homeStore),
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
              builder: (_) => const ModalSearchPackges(
                isStarnedNow: true,
                isView: false,
              ),
            );

            if (object == null) {
              await homeStore.getAllFavoritePackages();
              return;
            }

            homeStore.addPackageInList(packages: object);
          },
          label: Text(AppLocalizations.of(context)!.buttonHomeAddCode),
        ),
      ),
    );
  }
}
