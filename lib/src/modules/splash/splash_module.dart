import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'data/repositories/splash_repository.dart';
import 'presentation/controller/splash_controller.dart';
import 'presentation/pages/splash_page.dart';

class SplashModules extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashRepository.new);
    i.addLazySingleton(SplashController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    super.routes(r);
  }
}
