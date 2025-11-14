import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../stores/home_store.dart';

class ListViewHeader extends SliverPersistentHeaderDelegate {
  static const double _height = 60;
  @override
  final double minExtent;
  @override
  final double maxExtent;

  final HomeStore homeStore;
  final TextEditingController controller;
  final Color? backgroundColor;
  final VoidCallback onFilterPressed;

  ListViewHeader({
    required this.homeStore,
    required this.controller,
    required this.onFilterPressed,
    this.minExtent = _height,
    this.maxExtent = _height,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: _height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          if (overlapsContent)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppConstants.mediumSpacing),
        child: Row(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (_, value, _) {
                  return SearchBar(
                    controller: controller,
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: value.text.isNotEmpty
                            ? () {
                                controller.clear();
                                homeStore.search('');
                              }
                            : null,
                      ),
                    ],
                    hintText: AppLocalizations.of(context)!.searchPokemon,
                    elevation: WidgetStateProperty.all(0),
                    onChanged: (value) => homeStore.search(value),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: onFilterPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant ListViewHeader oldDelegate) {
    return oldDelegate.minExtent != minExtent ||
        oldDelegate.maxExtent != maxExtent ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
