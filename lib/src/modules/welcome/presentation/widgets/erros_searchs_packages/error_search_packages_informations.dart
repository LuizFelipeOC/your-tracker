import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'error_search_packages_items.dart';

class ErrorSearchPackageInformations extends StatelessWidget {
  const ErrorSearchPackageInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.errorGetPackage,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 20),
        ErrorsSearchPackagesItems(
          text: AppLocalizations.of(context)!.firstErrorGetPackage,
        ),
        const SizedBox(height: 5),
        ErrorsSearchPackagesItems(
          text: AppLocalizations.of(context)!.secondErrorGetPackage,
        ),
        const SizedBox(height: 5),
        ErrorsSearchPackagesItems(
          text: AppLocalizations.of(context)!.thirdErrorErrorGetPackage,
        ),
      ],
    );
  }
}
