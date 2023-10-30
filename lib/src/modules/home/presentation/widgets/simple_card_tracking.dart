import 'package:flutter/material.dart';

import '../../../../core/data/models/packages_model.dart';
import '../../../../core/themes/app_colors.dart';

class SimpleCardTracking extends StatelessWidget {
  const SimpleCardTracking({
    super.key,
    required this.item,
  });

  final PackagesModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    item.codigo,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 26,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '${item.eventos.first.data} ${item.eventos.first.hora}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
