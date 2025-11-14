import 'package:flutter/material.dart';

import '../../../global/app_core/store/store_imports.dart';
import '../../../global/constants/app_constants.dart';
import '../../../global/design_system/app_bar_widget.dart';
import '../../../global/design_system/scaffold_body.dart';
import '../../../global/l10n/app_localizations.dart';
import '../../../global/settings/app_settings_store.dart';
import '../../../global/themes/app_theme_mode.dart';
import '../../../global/utils/app_utils.dart';
import '../widgets/language_selector.dart';

/// Settings page for the application
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = AppSettingsStore.instance;

    return Scaffold(
      appBar: AppBarWidget(
        title: Text(AppLocalizations.of(context)!.settingsTitle),
      ),
      body: ScaffoldBody(
        child: ValueStoreBuilder<AppSettingsStore, AppSettings>(
          store: settingsStore,
          builder: (context, state) {
            return state.when(
              idle: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (settings) => _buildSettingsContent(context, settingsStore, settings),
              error: (error) => Center(
                child: Column(
                  spacing: AppConstants.mediumSpacing,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: AppConstants.extraLargeIconSize, color: Colors.red),
                    Text(AppFailureMessage.get(error.code)),
                    ElevatedButton(
                      onPressed: () => settingsStore.initialize(),
                      child: Text(AppLocalizations.of(context)!.settingsRetry),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingsContent(BuildContext context, AppSettingsStore settingsStore, AppSettings settings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstants.mediumSpacing,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.mediumSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.settingsThemeSection,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppConstants.smallSpacing),
                RadioGroup<AppThemeMode>(
                  groupValue: settings.appThemeMode,
                  onChanged: (value) {
                    if (value != null) {
                      settingsStore.updateThemeMode(value);
                    }
                  },
                  child: Column(
                    children: AppThemeMode.values
                        .map(
                          (mode) => RadioListTile<AppThemeMode>(
                            title: Text(_getThemeDisplayName(context, mode)),
                            value: mode,
                            selected: mode == settings.appThemeMode,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Language Section
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.mediumSpacing),
            child: Column(
              spacing: AppConstants.mediumSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.settingsLanguageSection,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                LanguageSegmentedSelector(
                  selectedLanguage: settings.locale.languageCode,
                  onLanguageChanged: (languageCode) {
                    settingsStore.updateLocale(Locale(languageCode));
                  },
                ),
              ],
            ),
          ),
        ),
        // App Info Section
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.mediumSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.settingsAppInfoSection,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppConstants.smallSpacing),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: Text(AppLocalizations.of(context)!.appName),
                  subtitle: Text(AppConstants.appName),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: const Icon(Icons.tag),
                  title: Text(AppLocalizations.of(context)!.appVersion),
                  subtitle: Text('${AppConstants.appVersion} (${AppConstants.buildNumber})'),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getThemeDisplayName(BuildContext context, AppThemeMode mode) {
    final localizations = AppLocalizations.of(context);
    switch (mode) {
      case AppThemeMode.light:
        return localizations?.settingsThemeLight ?? 'Light';
      case AppThemeMode.dark:
        return localizations?.settingsThemeDark ?? 'Dark';
      case AppThemeMode.system:
        return localizations?.settingsThemeSystem ?? 'System';
    }
  }
}
