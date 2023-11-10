// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../themes/app_images.dart';

class BoxMessagesWidget extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;

  const BoxMessagesWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
  }) : super(key: key);

  @override
  State<BoxMessagesWidget> createState() => _BoxMessagesWidgetState();
}

class _BoxMessagesWidgetState extends State<BoxMessagesWidget> {
  bool animationBox = false;
  bool animationText = false;

  void _animtation() async {
    await Future.delayed(const Duration(milliseconds: 100));

    setState(() {
      animationText = true;
      animationBox = true;
    });
  }

  @override
  void initState() {
    _animtation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          firstChild: Stack(
            children: [
              Image.asset(
                AppImage.box,
                width: MediaQuery.of(context).size.width * 0.26,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 46,
                ),
              ),
            ],
          ),
          secondChild: Container(width: MediaQuery.of(context).size.width * 0.26),
          sizeCurve: Curves.fastLinearToSlowEaseIn,
          crossFadeState: animationBox ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: AnimatedCrossFade(
            firstChild: Text(
              widget.title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(letterSpacing: 2.25, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            secondChild: Container(height: 60),
            sizeCurve: Curves.fastLinearToSlowEaseIn,
            crossFadeState: animationText ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          ),
        ),
      ],
    );
  }
}
