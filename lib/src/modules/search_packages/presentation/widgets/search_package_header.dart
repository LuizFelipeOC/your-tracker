import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/controller/search_packages_controller.dart';
import '../../../../core/themes/app_colors.dart';

class SearchPackageHeaderWidget extends StatelessWidget {
  final SearchPackagesController searchController;

  const SearchPackageHeaderWidget({
    required this.searchController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () => Modular.to.pop(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 35,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                AppLocalizations.of(context)!.simpleSearch,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: AppColors.primaryColor,
                controller: searchController.trackCode,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.trackingCode,
                ),
                onChanged: (value) {
                  if (value.length >= 13) {
                    FocusScope.of(context).unfocus();
                    searchController.searchPackage();
                  }
                },
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();

                  if (value.length >= 13) {
                    searchController.searchPackage();
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () => {
                  FocusScope.of(context).unfocus(),
                  searchController.searchPackage(),
                },
                child: const Icon(Icons.search),
              ),
            )
          ],
        ),
      ],
    );
  }
}
