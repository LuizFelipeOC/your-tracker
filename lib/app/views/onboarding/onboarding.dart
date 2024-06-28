import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/app_images.dart';
import '../../utils/media_query_values.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    AppImages.onboardingImage,
                    width: context.width * .4,
                  ).animate().fade(
                        delay: Duration(milliseconds: 350),
                        duration: Duration(seconds: 1),
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Bem-Vindo ao Your Tracker',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).animate().fade(
                      delay: Duration(milliseconds: 350),
                      duration: Duration(seconds: 2),
                    ),
                Text(
                  'Controle suas encomendas do melhor jeito',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ).animate().fade(
                      delay: Duration(milliseconds: 350),
                      duration: Duration(seconds: 3),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 52,
            width: context.width * .90,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('PESQUISA RÁPIDA'),
            ),
          ).animate().fade(
                delay: Duration(milliseconds: 450),
                duration: Duration(seconds: 3),
              ),
        ],
      ),
    );
  }
}
