import 'package:flutter/widgets.dart';

import '../../../themes/app_images.dart';
import '../../lotties_widgets/lottie_assets.dart';

class LoadingSearchPackages extends StatelessWidget {
  final String title;

  const LoadingSearchPackages({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieAssetsWidget(
          pathAnimation: AppImage.laoding,
          width: MediaQuery.of(context).size.width * .5,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
