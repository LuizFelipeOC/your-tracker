import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../welcome/welcome_module.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule(), WelcomeModule()];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    super.routes(r);
  }
}
