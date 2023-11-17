import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeIcon extends StatelessWidget {
  final IconData fontAwesomeIcon;
  final double? size;
  final Color? color;

  const FontAwesomeIcon({
    super.key,
    required this.fontAwesomeIcon,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      fontAwesomeIcon,
      size: size,
      color: color,
    );
  }
}
