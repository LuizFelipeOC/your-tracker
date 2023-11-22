import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/font_awesome/font_awesome.dart';

class SearchPackagesHeader extends StatelessWidget {
  const SearchPackagesHeader({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      width: screen.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Modular.to.pop(),
            child: FontAwesomeIcon(
              fontAwesomeIcon: FontAwesomeIcons.arrowLeft,
              size: 35,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.fastSearchText,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 15),
          TextField(
            style: Theme.of(context).textTheme.labelSmall,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.trackingCodeText,
              counterText: '',
              suffixIcon: InkWell(
                onTap: () => {},
                borderRadius: BorderRadius.circular(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FontAwesomeIcon(
                      fontAwesomeIcon: FontAwesomeIcons.magnifyingGlass,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            cursorColor: AppColors.primary,
            maxLength: 13,
          ),
        ],
      ),
    );
  }
}
