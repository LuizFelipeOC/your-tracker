import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/font_awesome/font_awesome.dart';

class UnauthenticatedBodyDrawer extends StatelessWidget {
  const UnauthenticatedBodyDrawer({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: AppColors.secondary.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FontAwesomeIcon(
                  fontAwesomeIcon: FontAwesomeIcons.user,
                  size: screen.width * .15,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Acho que voce nao esta logado no momento, crie usa conta agora mesmo ou acesse uma ja existente',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Registrar'),
          ),
          const Text('ou'),
          TextButton(
            onPressed: () {},
            child: Text(
              'Entrar em uma conta ja existente',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
