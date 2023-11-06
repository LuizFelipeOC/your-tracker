import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../core/data/repositories/check_first_run_app/first_run_app_repository.dart';
import 'data/repositories/splash_repository.dart';
import 'presentation/controller/splash_controller.dart';
import 'presentation/pages/splash_page.dart';

class SplashModules extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.add(SplashRepository.new);
    i.add(SplashController.new);
    i.add(CheckFirstRunApp.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    super.routes(r);
  }
}
