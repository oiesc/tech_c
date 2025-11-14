import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_core/failures/app_failure.dart';
import '../app_core/store/store_imports.dart';
import '../services/app_storage/app_storage.dart';
import '../services/app_storage/app_storage_keys.dart';
import '../themes/app_theme_mode.dart';
import '../utils/app_failure_message.dart';

/// Model for app settings
class AppSettings {
  final AppThemeMode appThemeMode;
  final Locale locale;

  const AppSettings({
    required this.appThemeMode,
    required this.locale,
  });

  AppSettings copyWith({
    AppThemeMode? appThemeMode,
    Locale? locale,
  }) {
    return AppSettings(
      appThemeMode: appThemeMode ?? this.appThemeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings && other.appThemeMode == appThemeMode && other.locale == locale;
  }

  @override
  int get hashCode => appThemeMode.hashCode ^ locale.hashCode;

  @override
  String toString() {
    return 'AppSettings(appThemeMode: $appThemeMode, locale: $locale)';
  }
}

/// Store for managing application settings using ValueStore
class AppSettingsStore extends ValueStore<AppSettings> {
  AppSettingsStore() : super(null);

  SharedPreferences? _prefs;

  /// Get the AppSettingsStore instance from GetIt
  static AppSettingsStore get instance => GetIt.I<AppSettingsStore>();

  /// Initialize the settings store
  Future<void> initialize() async {
    try {
      updateState(const LoadingState<AppSettings>());
      await GetIt.I<AppStorage>().initialize();
      _prefs = GetIt.I<AppStorage>().prefs;
      await _loadSettings();
    } catch (error) {
      updateState(
        ErrorState<AppSettings>(
          AppGenericFailure(
            message: AppFailureMessage.get('settings_initialization_failure'),
            error: error,
          ),
        ),
      );
    }
  }

  /// Load settings from storage
  Future<void> _loadSettings() async {
    try {
      final themeString = _prefs?.getString(AppStorageKeys.themeKey) ?? 'system';
      final languageCode = _prefs?.getString(AppStorageKeys.languageKey) ?? 'en';

      final settings = AppSettings(
        appThemeMode: AppThemeModeExtension.fromString(themeString),
        locale: Locale(languageCode),
      );

      updateState(SuccessState<AppSettings>(settings));
    } catch (error) {
      updateState(
        ErrorState<AppSettings>(
          AppGenericFailure(
            message: AppFailureMessage.get('settings_load_failure'),
            error: error,
          ),
        ),
      );
    }
  }

  /// Update theme mode
  Future<void> updateThemeMode(AppThemeMode themeMode) async {
    try {
      final currentSettings = state.foldSuccess(
        success: (data) => data,
        orElse: () => const AppSettings(
          appThemeMode: AppThemeMode.system,
          locale: Locale('en'),
        ),
      );

      final newSettings = currentSettings.copyWith(appThemeMode: themeMode);

      await _prefs?.setString(AppStorageKeys.themeKey, themeMode.name);
      updateState(SuccessState<AppSettings>(newSettings));
    } catch (error) {
      updateState(
        ErrorState<AppSettings>(
          AppGenericFailure(
            message: AppFailureMessage.get('theme_update_failure'),
            error: error,
          ),
        ),
      );
    }
  }

  /// Update locale
  Future<void> updateLocale(Locale locale) async {
    try {
      final currentSettings = state.foldSuccess(
        success: (data) => data,
        orElse: () => const AppSettings(
          appThemeMode: AppThemeMode.system,
          locale: Locale('en'),
        ),
      );

      final newSettings = currentSettings.copyWith(locale: locale);

      await _prefs?.setString(AppStorageKeys.languageKey, locale.languageCode);
      updateState(SuccessState<AppSettings>(newSettings));
    } catch (error) {
      updateState(
        ErrorState<AppSettings>(
          AppGenericFailure(
            message: AppFailureMessage.get('locale_update_failure'),
            error: error,
          ),
        ),
      );
    }
  }

  /// Get current theme mode
  AppThemeMode get currentThemeMode {
    return state.foldSuccess(
      success: (data) => data.appThemeMode,
      orElse: () => AppThemeMode.system,
    );
  }

  /// Get current locale
  Locale get currentLocale {
    return state.foldSuccess(
      success: (data) => data.locale,
      orElse: () => const Locale('en'),
    );
  }
}
