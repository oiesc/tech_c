import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/navigation_service.dart';

typedef L10nTextBuilder = String Function(AppLocalizations l10n);

class AppFailureMessage {
  /// Returns a localized string based on the given error code.
  ///
  /// If the [context] is null, it will use the [NavigationService.context].
  ///
  /// The method will return the code itself as a fallback message if the
  /// error code is not recognized.
  static String get(String code, {BuildContext? context}) {
    context ??= NavigationService.context;

    if (context == null) return code;

    final l10n = AppLocalizations.of(context)!;

    final key = _formatKey(code);

    final builder = _localizationMap[key];

    if (builder != null) {
      return builder(l10n);
    }

    return code;
  }

  static final Map<String, L10nTextBuilder> _localizationMap = {
    'localeUpdateFailure': (l10n) => l10n.errorLocaleUpdateFailure,
    'networkError': (l10n) => l10n.errorNetworkError,
    'dataParsingError': (l10n) => l10n.errorDataParsingError,
    'timeout': (l10n) => l10n.errorTimeout,
    'serverError': (l10n) => l10n.errorServerError,
    'unauthorized': (l10n) => l10n.errorUnauthorized,
    'notFound': (l10n) => l10n.errorNotFound,

    // HOME
    'homeInvalidData': (l10n) => l10n.homeErrorInvalidData,
    'homeFailedRequest': (l10n) => l10n.homeErrorFailedRequest,
    'homeUnexpectedError': (l10n) => l10n.homeErrorUnexpectedError,
    'homeFormatError': (l10n) => l10n.homeErrorFormatError,
    'homeNoData': (l10n) => l10n.homeErrorNoData,
    'homeNullData': (l10n) => l10n.homeErrorNullData,
    'homeNotFound': (l10n) => l10n.homeErrorNotFound,
    'homeServerError': (l10n) => l10n.homeErrorServerError,

    // SETTINGS
    'settingsInitializationFailure': (l10n) => l10n.errorSettingsInitializationFailure,
    'settingsLoadFailure': (l10n) => l10n.errorSettingsLoadFailure,
    'themeUpdateFailure': (l10n) => l10n.errorThemeUpdateFailure,
  };

  /// Replaces all occurrences of underscores followed by a lowercase letter
  /// with the uppercase equivalent of that letter.
  ///
  /// For example, "home_error" will be replaced with "homeError".
  ///
  /// This method is used to format error codes into a format that can be
  /// used to look up localized error messages.
  ///
  /// The method uses a regular expression to find all occurrences of
  /// underscores followed by a lowercase letter, and replaces them with the
  /// uppercase equivalent of that letter.
  static String _formatKey(String code) {
    return code.replaceAllMapped(
      RegExp(r'_([a-z])'),
      (match) => match.group(1)!.toUpperCase(),
    );
  }
}
