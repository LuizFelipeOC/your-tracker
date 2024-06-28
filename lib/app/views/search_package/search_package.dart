import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/media_query_values.dart';
import '../../widgets/tracking_app_bar.dart';
import 'search_controller.dart';

class SearchPackage extends StatefulWidget {
  const SearchPackage({super.key});

  @override
  State<SearchPackage> createState() => _SearchPackageState();
}

class _SearchPackageState extends State<SearchPackage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late SearchPackagesController _controller;

  @override
  void initState() {
    if (mounted) {
      _controller = context.read<SearchPackagesController>();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: TrackingAppBar(
                title: 'Pesquisar pacote',
                suffixIcon: Icon(Icons.question_answer, size: 32),
                onTap: () => Navigator.pop(context),
              ).animate().fadeIn(
                    delay: Duration(milliseconds: 250),
                    duration: Duration(seconds: 1),
                  ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: context.width * .89,
              child: Form(
                key: _key,
                child: TextFormField(
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  controller: _controller.trackingCode,
                  onFieldSubmitted: (value) {
                    if (!_key.currentState!.validate()) {
                      return;
                    }

                    _controller.getPackage();
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

                          _controller.getPackage();
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
            ValueListenableBuilder(
              valueListenable: _controller,
              builder: (_, states, __) {
                if (states == SearchState.idle) {
                  return SizedBox(
                    width: context.width * .92,
                    height: context.height * .7,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                AppImages.searchPackage,
                                width: context.width * .45,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Você está pronto para pesquisar sua encomenda ?',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: 400),
                            duration: Duration(seconds: 2),
                          ),
                    ),
                  );
                }

                if (states == SearchState.error) {
                  return SizedBox(
                    width: context.width * .92,
                    height: context.height * .7,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                AppImages.searchPackageError,
                                width: context.width * .45,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            _controller.errorMessage,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: 400),
                            duration: Duration(seconds: 2),
                          ),
                    ),
                  );
                }

                if (states == SearchState.laoding) {
                  return SizedBox(
                      width: context.width,
                      height: context.height * .7,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 0.4,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Buscando sua encomenda',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ));
                }

                if (states == SearchState.success) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            _controller.packageModel.code,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ).animate().fadeIn(
                                delay: Duration(milliseconds: 400),
                                duration: Duration(seconds: 1),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Ultima atualização${_controller.packageModel.lastUpdate}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ).animate().fadeIn(
                                delay: Duration(milliseconds: 400),
                                duration: Duration(seconds: 1),
                              ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          physics: const BouncingScrollPhysics(),
                          itemCount: _controller.packageModel.events.length,
                          itemBuilder: (BuildContext context, int index) {
                            final events = _controller.packageModel.events[index];

                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${events.date} ${events.hours}',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ).animate().fadeIn(
                                          delay: Duration(milliseconds: 240),
                                          duration: Duration(seconds: 1),
                                        ),
                                    Text(
                                      events.status,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ).animate().fadeIn(
                                          delay: Duration(milliseconds: 250),
                                          duration: Duration(seconds: 1),
                                        ),
                                    Text(
                                      events.place,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ).animate().fadeIn(
                                          delay: Duration(milliseconds: 260),
                                          duration: Duration(seconds: 1),
                                        ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).animate().fadeIn(
                              delay: Duration(milliseconds: 400),
                              duration: Duration(seconds: 1),
                            ),
                      ],
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (_, value, __) {
          if (value == SearchState.success) {
            return FloatingActionButton.extended(
              label: Text('Salvar pacote'),
              onPressed: () {},
            ).animate().fadeIn(
                  delay: Duration(milliseconds: 350),
                  duration: Duration(seconds: 1),
                );
          }

          return SizedBox();
        },
      ),
    );
  }
}
