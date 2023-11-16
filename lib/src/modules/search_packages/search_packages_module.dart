import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/search_packages.dart';

class SearchPackagesModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SearchPackagesPage(),
      transition: TransitionType.rightToLeftWithFade,
      duration: const Duration(milliseconds: 400),
    );
    super.routes(r);
  }
}
