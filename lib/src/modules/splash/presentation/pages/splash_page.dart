import 'package:flutter/material.dart';

import '../../../../core/themes/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImage.welcomeImage,
          width: screen.width * .3,
        ),
      ),
    );
  }
}
