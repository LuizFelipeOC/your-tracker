import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/app_colors.dart';
import '../../utils/media_query_values.dart';
import '../../widgets/tracking_app_bar.dart';

class SearchPackage extends StatefulWidget {
  const SearchPackage({super.key});

  @override
  State<SearchPackage> createState() => _SearchPackageState();
}

class _SearchPackageState extends State<SearchPackage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TrackingAppBar(
                title: 'Pesquisar pacote',
                suffixIcon: Icon(Icons.question_answer, size: 32),
                onTap: () => Navigator.pop(context),
              ).animate().fadeIn(
                    delay: Duration(milliseconds: 250),
                    duration: Duration(seconds: 1),
                  ),
              const SizedBox(height: 30),
              SizedBox(
                width: context.width * .92,
                child: Form(
                  key: _key,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      if (!_key.currentState!.validate()) {
                        return;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O código de rastreio é obrigatório';
                      }

                      return null;
                    },
                    autofocus: true,
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      hintText: 'Código de rastreio',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            if (!_key.currentState!.validate()) {
                              return;
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Icon(Icons.search, size: 30, color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ).animate().fadeIn(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
