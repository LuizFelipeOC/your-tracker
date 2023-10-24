import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/splash_page.dart';

class SplashModules extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 350),
    );
    super.routes(r);
  }
}
