import 'package:flutter/material.dart';

class HomeDrawerOptions extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const HomeDrawerOptions({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(title)
        ],
      ),
    );
  }
}
