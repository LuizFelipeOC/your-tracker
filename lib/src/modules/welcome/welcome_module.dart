import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/welcome_page.dart';

final class WelcomeModule extends Module {
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
