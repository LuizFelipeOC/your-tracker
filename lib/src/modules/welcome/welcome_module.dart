import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    super.routes(r);
  }
}
