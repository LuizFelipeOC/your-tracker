import 'package:flutter/material.dart';

import '../../themes/app_images.dart';

class BoxMessagesWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;

  const BoxMessagesWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              AppImage.box,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Icon(
                icon,
                color: iconColor,
                size: 50,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
