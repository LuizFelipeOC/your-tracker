import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'core/services/http/http.dart';
import 'core/services/http/uno.dart';
import 'modules/welcome/welcome_module.dart';

final class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(Uno.new);
    i.addLazySingleton<IHttpService>(UnoService.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: WelcomeModule());
    super.routes(r);
  }
}
