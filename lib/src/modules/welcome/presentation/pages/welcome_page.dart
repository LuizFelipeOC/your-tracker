import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/welcome_page_bottom.dart';
import '../components/welcome_page_header.dart';
import '../components/welcome_page_middle.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            const Expanded(
              child: WelcomePageHeader(),
            ),
            Expanded(
              child: WelcomePageMiddle(screen: screen),
            ),
            Expanded(
              child: WelcomePageBottom(screen: screen),
            )
          ],
        ),
      ),
    );
  }
}
