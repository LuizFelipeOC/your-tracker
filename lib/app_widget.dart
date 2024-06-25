import 'package:flutter/material.dart';

import 'app/pages/onboarding/onboarding.dart';
import 'app/utils/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
