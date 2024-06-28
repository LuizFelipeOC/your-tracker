import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/utils/providers.dart';
import 'app/views/onboarding/onboarding.dart';
import 'app/utils/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: LightTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
