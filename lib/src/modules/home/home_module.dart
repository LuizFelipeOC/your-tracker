import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.add(HomeController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    super.routes(r);
  }
}
