import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/widgets/font_awesome/font_awesome.dart';

class ListPackagesHeader extends StatelessWidget {
  const ListPackagesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Packages',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          InkWell(
            onTap: () => {},
            child: const FontAwesomeIcon(
              fontAwesomeIcon: FontAwesomeIcons.circlePlus,
              size: 36,
            ),
          )
        ],
      ),
    );
  }
}
