import 'package:flutter/material.dart';

import '../../../controller/search_packages_controller.dart';
import '../../../themes/app_images.dart';

class FavoritedMessagePackage extends StatefulWidget {
  final SearchPackagesController controller;
  final IconData iconData;
  final Widget? child;
  final Color iconColor;
  final String title;

  const FavoritedMessagePackage({
    super.key,
    required this.controller,
    required this.iconData,
    this.child,
    required this.iconColor,
    required this.title,
  });

  @override
  State<FavoritedMessagePackage> createState() => _SuccessSavedPackageState();
}

class _SuccessSavedPackageState extends State<FavoritedMessagePackage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                AppImage.box,
                width: MediaQuery.of(context).size.width * .3,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  widget.iconData,
                  color: widget.iconColor,
                  size: 50,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          widget.child ?? const SizedBox(),
        ],
      ),
    );
  }
}
