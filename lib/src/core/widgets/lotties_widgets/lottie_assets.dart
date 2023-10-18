import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAssetsWidget extends StatelessWidget {
  const LottieAssetsWidget({
    Key? key,
    required this.pathAnimation,
    this.heigth,
    this.width,
  }) : super(key: key);

  final String pathAnimation;
  final double? heigth;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      pathAnimation,
      width: width,
      height: heigth,
      repeat: true,
    );
  }
}
