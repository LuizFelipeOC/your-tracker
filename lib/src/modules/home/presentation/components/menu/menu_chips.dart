import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controller/chips_controller.dart';

class MenuChips extends StatefulWidget {
  const MenuChips({
    super.key,
  });

  @override
  State<MenuChips> createState() => _OptionsHomeState();
}

class _OptionsHomeState extends State<MenuChips> {
  final controller = Modular.get<ChipsController>();

  @override
  void initState() {
    controller.choise = 'Recentes';

    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ChoiceChip(
            label: const Padding(
              padding: EdgeInsets.all(5),
              child: Text('Recentes'),
            ),
            selected: (controller.choise == 'Recentes'),
            onSelected: (value) {
              controller.selectChips(value: 'Recentes');
            },
          ),
          ChoiceChip(
            label: const Padding(
              padding: EdgeInsets.all(5),
              child: Text('Favoritos'),
            ),
            selected: (controller.choise == 'Favoritos'),
            onSelected: (value) {
              controller.selectChips(value: 'Favoritos');
            },
          ),
        ],
      ),
    );
  }
}
