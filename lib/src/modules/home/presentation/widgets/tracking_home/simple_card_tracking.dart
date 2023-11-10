import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/modal_search_packages/modal_search_packages.dart';
import '../../../../search_packages/data/models/packages_model.dart';

class SimpleCardTracking extends StatelessWidget {
  const SimpleCardTracking({super.key, required this.item});

  final PackagesModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.55,
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
                  onTap: () async {
                    await showModalBottomSheet<PackagesModel>(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) => ModalSearchPackges(
                        isStarnedNow: false,
                        isView: true,
                        code: item.codigo,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 26,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
