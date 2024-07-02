import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../services/database/database.dart';
import '../../utils/app_images.dart';
import '../../utils/media_query_values.dart';
import '../search_package/search_package.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late IDatabase _databaseController;

  @override
  void initState() {
    _databaseController = context.read<IDatabase>();

    _databaseController.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextButton(
                onPressed: () {},
                child: Text('SIGN IN'),
              ).animate().fade(
                    delay: Duration(milliseconds: 250),
                    duration: Duration(seconds: 1),
                  ),
            ),
          ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                    builder: (_) => const SearchPackage(),
                  ),
                );
              },
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
