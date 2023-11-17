import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/font_awesome/font_awesome.dart';

class UnauthenticatedBodyDrawer extends StatelessWidget {
  const UnauthenticatedBodyDrawer({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: AppColors.secondary.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FontAwesomeIcon(
                  fontAwesomeIcon: FontAwesomeIcons.user,
                  size: screen.width * .15,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text.rich(
              TextSpan(
                text: AppLocalizations.of(context)!.unauthenticatedFirstMessage,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: AppColors.primary.withOpacity(0.9),
                      fontWeight: FontWeight.w700,
                    ),
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.unauthenticatedSecondMessage,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.registerMessage),
          ),
          const SizedBox(height: 5),
          Text(AppLocalizations.of(context)!.or),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.alreadyAccountMessage,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
