import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/messages_widgets/box_message_widgets.dart';
import '../../../../core/widgets/modal_search_packages/states_widgets/loading_search_packages.dart';
import '../controller/home_controller.dart';
import '../controller/states/home_state.dart';
import 'simple_card_tracking.dart';

class ListCodesTrackingSavedWidget extends StatefulWidget {
  const ListCodesTrackingSavedWidget({
    super.key,
    required this.homeStore,
  });

  final HomeController homeStore;

  @override
  State<ListCodesTrackingSavedWidget> createState() => _ListCodesTrackingSavedWidgetState();
}

class _ListCodesTrackingSavedWidgetState extends State<ListCodesTrackingSavedWidget> with SingleTickerProviderStateMixin {
  @override
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.homeStore,
      builder: (ctx, state, _) {
        if (state is LoadingHomeState) {
          return Center(
            child: LoadingSearchPackages(
              title: AppLocalizations.of(context)!.loadingMyPackages,
            ),
          );
        }

        if (state is ErrorHomeState) {
          return Center(
            child: BoxMessagesWidget(
              icon: Icons.error_outline_outlined,
              iconColor: AppColors.red,
              title: AppLocalizations.of(context)!.errorHomeItems,
            ),
          );
        }

        if (state is EmptyHomeState) {
          return Center(
            child: BoxMessagesWidget(
              icon: Icons.warning_amber_rounded,
              iconColor: AppColors.orange,
              title: AppLocalizations.of(context)!.emptyHomeItems,
            ),
          );
        }

        if (state is SuccessHomeState) {
          return RefreshIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.primaryColor,
            onRefresh: () => widget.homeStore.getAllFavoritePackages(),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.list.length,
              itemBuilder: (ctx, index) {
                final item = state.list[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: SimpleCardTracking(item: item),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
