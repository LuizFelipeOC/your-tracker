import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../themes/app_images.dart';
import '../lotties_widgets/lottie_assets.dart';

class LoadingSearchPackages extends StatelessWidget {
  const LoadingSearchPackages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieAssetsWidget(
            pathAnimation: AppImage.laoding,
            width: MediaQuery.of(context).size.width * .7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalizations.of(context)!.searchingPackage,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
