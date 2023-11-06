import 'package:flutter/material.dart';

import '../../data/models/events_model.dart';
import '../../themes/app_colors.dart';

class CardTrackingPackages extends StatelessWidget {
  const CardTrackingPackages({
    super.key,
    required this.items,
  });

  final EventsModel items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              items.data,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 10),
            Text(
              items.local,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            Text(
              items.status,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
