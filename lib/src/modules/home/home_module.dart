import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/root_controller.dart';
import 'presentation/pages/root_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(RootController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const RootPage(),
      transition: TransitionType.rightToLeftWithFade,
      duration: const Duration(milliseconds: 400),
    );
    super.routes(r);
  }
}
