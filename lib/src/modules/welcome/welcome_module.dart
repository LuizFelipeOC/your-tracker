import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../core/data/repositories/search_packages/search_packages_repository.dart';
import 'presentation/pages/welcome_page.dart';

final class WelcomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SearchPackagesRepository.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const WelcomePage(),
      duration: const Duration(milliseconds: 200),
      transition: TransitionType.fadeIn,
    );
    super.routes(r);
  }
}
