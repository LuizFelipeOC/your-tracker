import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/font_awesome/font_awesome.dart';

class HomePageHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  const HomePageHeader({
    required this.scaffoldState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'Here you get view your recent  or favorited packages!',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => scaffoldState..currentState!.openEndDrawer(),
            child: const FontAwesomeIcon(
              fontAwesomeIcon: FontAwesomeIcons.barsStaggered,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
