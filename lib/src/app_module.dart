import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uno/uno.dart';

import 'core/services/http/http.dart';
import 'core/services/http/uno.dart';
import 'core/services/local_storage/flutter_secure_storage.dart';
import 'core/services/local_storage/local_storage_dart.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/welcome/welcome_module.dart';

final class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(Uno.new);
    i.addLazySingleton<IHttpService>(UnoService.new);
    i.addLazySingleton(FlutterSecureStorage.new);
    i.addLazySingleton<ILocalStorage>(FlutterSecureStorageService.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: SplashModules(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 400),
    );
    r.module(
      '/welcome/',
      module: WelcomeModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 400),
    );
    r.module(
      '/home/',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 400),
    );
    super.routes(r);
  }
}
