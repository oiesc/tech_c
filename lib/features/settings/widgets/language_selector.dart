import 'package:flutter/material.dart';

import '../../../global/l10n/app_localizations.dart';

/// A modern language selector using SegmentedButton
class LanguageSegmentedSelector extends StatelessWidget {
  const LanguageSegmentedSelector({
    required this.selectedLanguage,
    required this.onLanguageChanged,
    super.key,
  });

  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<String>(
        segments: [
          ButtonSegment<String>(
            value: 'en',
            label: Text(localizations.settingsLanguageEnglish),
            icon: const Icon(Icons.language),
          ),
          ButtonSegment<String>(
            value: 'pt',
            label: Text(localizations.settingsLanguagePortuguese),
            icon: const Icon(Icons.language),
          ),
        ],
        selected: {selectedLanguage},
        onSelectionChanged: (Set<String> newSelection) {
          if (newSelection.isNotEmpty) {
            onLanguageChanged(newSelection.first);
          }
        },
        style: SegmentedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          selectedBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
          selectedForegroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
