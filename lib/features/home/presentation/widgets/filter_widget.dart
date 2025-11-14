import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../utils/home_utils.dart';

class FilterWidget extends StatefulWidget {
  final List<String> allTypes;
  final Function(String type) onFilterChanged;
  const FilterWidget({required this.allTypes, required this.onFilterChanged, super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {}, // avoid close on tap inside the card
                child: Container(
                  margin: const EdgeInsets.only(
                    left: AppConstants.mediumSpacing,
                    right: AppConstants.mediumSpacing,
                    top: AppConstants.largeSpacing,
                    bottom: AppConstants.largeSpacing,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              AppLocalizations.of(context)!.filterByType,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextButton(
                            onPressed: () => widget.onFilterChanged(''),
                            child: Text(AppLocalizations.of(context)!.clearFilter),
                          ),
                        ],
                      ),
                      const Divider(height: 1),
                      Flexible(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: AppConstants.mediumSpacing,
                            runSpacing: AppConstants.smallSpacing,
                            children: widget.allTypes.map((type) {
                              return ActionChip(
                                side: BorderSide.none,
                                backgroundColor: HomeUtils.getChipColor(type),
                                label: Text(
                                  type,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: HomeUtils.getChipTextColor(type),
                                  ),
                                ),
                                onPressed: () => widget.onFilterChanged(type),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
