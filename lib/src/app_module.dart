import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'core/services/cache/cache_interface.dart';
import 'core/services/cache/cache_service.dart';
import 'core/services/database/database_interface.dart';
import 'core/services/database/database_service.dart';
import 'core/services/uno/http_interface.dart';
import 'core/services/uno/uno_service.dart';
import 'modules/home/home_module.dart';
import 'modules/search_packages/search_packages_module.dart';
import 'modules/welcome/welcome_module.dart';

final class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(Uno.new);
    i.addSingleton<IHttpService>(UnoService.new);
    i.addSingleton<ICache>(CacheService.new);
    i.add<IDatabase>(DatabaseService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: WelcomeModule());
    r.module('/search-packages/', module: SearchPackagesModule());
    r.module('/home/', module: HomeModule());
    super.routes(r);
  }
}
