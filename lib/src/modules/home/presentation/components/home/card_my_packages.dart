import 'package:flutter/material.dart';

import '../../../../../core/constants/app_images.dart';

class CardMyPackages extends StatelessWidget {
  const CardMyPackages({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImgaes.boxImage,
                  width: screen.width * .16,
                ),
              ],
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Objeto entregue ao destinatário',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Local: Unidade de Distribuição - Cuiaba / MT',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '24/05/2022',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
