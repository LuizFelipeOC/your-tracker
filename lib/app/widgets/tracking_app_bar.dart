import 'package:flutter/material.dart';

class TrackingAppBar extends StatelessWidget {
  final String? title;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnTp;

  const TrackingAppBar({super.key, this.title, this.suffixIcon, this.onTap, this.suffixOnTp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20),
                child: Icon(Icons.chevron_left, size: 45),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: suffixIcon == null ? null : suffixOnTp,
                child: suffixIcon ?? Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
