import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../core/controller/search_packages_controller.dart';
import '../../core/data/repositories/search_packages/packages_interface.dart';
import '../../core/data/repositories/search_packages/search_packages_repository.dart';
import 'presentation/pages/search_packages_page.dart';

class SearchPackagesModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.add<IPackges>(SearchPackagesRepository.new);
    i.add(SearchPackagesController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => SearchPackagesPage(
        isOnlyView: r.args.data,
      ),
    );
    super.routes(r);
  }
}
