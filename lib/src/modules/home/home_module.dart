import 'package:flutter_modular/flutter_modular.dart';
import 'package:your_tracker/src/core/data/repositories/search_packages/packages_interface.dart';

import '../../app_module.dart';
import '../../core/data/repositories/search_packages/search_packages_repository.dart';
import '../welcome/welcome_module.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule(), WelcomeModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IPackges>(SearchPackagesRepository.new);
    i.add(HomeController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    super.routes(r);
  }
}
