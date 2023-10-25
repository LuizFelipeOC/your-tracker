import 'package:flutter/material.dart';

import '../../../../core/data/models/events_model.dart';
import '../../../../core/themes/app_colors.dart';

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
              items.status,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            Text(
              items.local,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.subStatus?.length,
              itemBuilder: (ctx, idx) {
                final subEvents = items.subStatus?[idx];
                return Text(
                  subEvents.toString().replaceAll('[', '').replaceAll(']', ''),
                  style: Theme.of(context).textTheme.labelMedium,
                );
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                '${items.data}  ${items.hora}',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
