import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/themes/app_colors.dart';
import '../controller/home_controller.dart';
import '../widgets/drawer/home_drawer.dart';
import '../widgets/home_bar.dart';
import '../widgets/tracking_home/list_codes_tracking_saved.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.animationAppBar();
      homeController.getAllFavoritePackages();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        endDrawer: HomeDrawerWidget(screen: screen),
        key: _scaffolKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              gradient: AppColors.linear,
            ),
            child: HomeBarWidget(
              scaffolKey: _scaffolKey,
              controller: homeController,
            ),
          ),
        ),
        body: SizedBox(
          height: screen.height,
          child: Column(
            children: [
              Expanded(
                child: ListCodesTrackingSavedWidget(
                  homeStore: homeController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
