import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../controller/welcome_controller.dart';
import '../states/welcome_state.dart';
import '../widgets/welcome_bottom.dart';
import '../widgets/welcome_centered.dart';
import '../widgets/welcome_header.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _welcomeController = Modular.get<WelcomeController>();

  @override
  void initState() {
    _welcomeController.addListener(() {
      if (_welcomeController.value is SuccessWelcomeState) {
        Navigator.pushReplacementNamed(context, '/home/');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                child: WelcomeHeaderWidget(),
              ),
              Expanded(
                child: WelcomeCenteredMessageWidget(screen: screen),
              ),
              Expanded(
                child: WelcomeBottomWidget(
                  screen: screen,
                  welcomeController: _welcomeController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
