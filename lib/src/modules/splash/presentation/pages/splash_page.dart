import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/themes/app_images.dart';
import '../controller/splash_controller.dart';
import '../states/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final store = Modular.get<SplashController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.verifyExistData();

      store.addListener(() {
        if (store.value is SuccessSplashState) {
          Modular.to.pushReplacementNamed('/home/');
        }

        if (store.value is ErrorSplashState) {
          Modular.to.pushReplacementNamed('/welcome/');
        }
      });
    });
    super.initState();
  }

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
