import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/animation_entrace_controller.dart';
import 'presentation/pages/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(AnimationEntranceController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    super.routes(r);
  }
}
