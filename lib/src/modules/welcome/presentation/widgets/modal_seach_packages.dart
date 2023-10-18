import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/themes/app_colors.dart';

class ModalSearchPackges extends StatefulWidget {
  const ModalSearchPackges({
    super.key,
  });

  @override
  State<ModalSearchPackges> createState() => _ModalSearchPackgesState();
}

class _ModalSearchPackgesState extends State<ModalSearchPackges> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Simple Search',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              InkWell(
                overlayColor: MaterialStatePropertyAll(AppColors.grey.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(50),
                onTap: () => Modular.to.pop(),
                child: const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLength: 13,
                  style: Theme.of(context).textTheme.labelLarge,
                  cursorColor: AppColors.secondaryColor,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Tracking code',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.search,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
