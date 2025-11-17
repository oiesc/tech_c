import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import 'filter_widget.dart';

class ListViewHeader extends SliverPersistentHeaderDelegate {
  final Function(String query) onSearch;
  final TextEditingController controller;
  final Color? backgroundColor;
  final VoidCallback onFilterPressed;
  final String selectedType;

  ListViewHeader({
    required this.onSearch,
    required this.controller,
    required this.onFilterPressed,
    required this.selectedType,
    this.backgroundColor,
  });

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: maxExtent,
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
            if (selectedType.isEmpty)
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, value, _) {
                    return SearchBar(
                      controller: controller,
                      trailing: [
                        if (controller.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              controller.clear();
                              onSearch('');
                            },
                          ),
                      ],
                      hintText: AppLocalizations.of(context)!.searchPokemon,
                      elevation: WidgetStateProperty.all(0),
                      onChanged: (value) => onSearch(value),
                    );
                  },
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppConstants.smallSpacing),
                  child: SelectedFilterWidget(selectedType: selectedType),
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
    return oldDelegate.backgroundColor != backgroundColor || oldDelegate.selectedType != selectedType;
  }
}
