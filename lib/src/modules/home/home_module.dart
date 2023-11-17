import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/chips_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ChipsController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
      transition: TransitionType.rightToLeftWithFade,
      duration: const Duration(milliseconds: 400),
    );
    super.routes(r);
  }
}
