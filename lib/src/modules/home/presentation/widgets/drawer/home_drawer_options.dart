import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/model/drawer_routes_model.dart';

class HomeDrawerOptions extends StatelessWidget {
  final DrawerRoutesModel routes;
  final IconData icons;

  const HomeDrawerOptions({super.key, required this.routes, required this.icons});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(routes.routes),
      child: Row(
        children: [
          Icon(icons, size: 30),
          const SizedBox(width: 10),
          Text(routes.title),
        ],
      ),
    );
  }
}
