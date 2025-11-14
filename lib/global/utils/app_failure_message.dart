import 'package:flutter/material.dart';

import '../app_core/failures/navigation_service.dart';
import '../l10n/app_localizations.dart';

class AppFailureMessage {
  /// Returns a localized string based on the given error code.
  ///
  /// If the [context] is null, it will use the [NavigationService.context].
  ///
  /// The method will return the code itself as a fallback message if the
  /// error code is not recognized.
  static String get(String code, {BuildContext? context}) {
    context ??= NavigationService.context;

    if (context == null) {
      return _getFallback(code);
    }

    final l10n = AppLocalizations.of(context)!;

    final errorKey = _formatErrorKey(code);

    switch (errorKey) {
      case 'localeUpdateFailure':
        return l10n.errorLocaleUpdateFailure;
      case 'networkError':
        return l10n.errorNetworkError;
      case 'dataParsingError':
        return l10n.errorDataParsingError;
      case 'timeout':
        return l10n.errorTimeout;
      case 'serverError':
        return l10n.errorServerError;
      case 'unauthorized':
        return l10n.errorUnauthorized;
      case 'notFound':
        return l10n.errorNotFound;
      // Home-specific errors
      case 'invalidData':
        return l10n.homeErrorInvalidData;
      case 'failedRequest':
        return l10n.homeErrorFailedRequest;
      case 'unexpectedError':
        return l10n.homeErrorUnexpectedError;
      case 'formatError':
        return l10n.homeErrorFormatError;
      case 'noData':
        return l10n.homeErrorNoData;
      case 'homeNoData':
        return l10n.homeErrorNoData;
      case 'homeNullData':
        return l10n.homeErrorNullData;
      case 'homeInvalidData':
        return l10n.homeErrorInvalidData;
      case 'homeNotFound':
        return l10n.homeErrorNotFound;
      case 'homeServerError':
        return l10n.homeErrorServerError;
      case 'homeFailedRequest':
        return l10n.homeErrorFailedRequest;
      case 'homeUnexpectedError':
        return l10n.homeErrorUnexpectedError;
      case 'homeFormatError':
        return l10n.homeErrorFormatError;
      // Settings-specific errors
      case 'settingsInitializationFailure':
        return l10n.errorSettingsInitializationFailure;
      case 'settingsLoadFailure':
        return l10n.errorSettingsLoadFailure;
      case 'themeUpdateFailure':
        return l10n.errorThemeUpdateFailure;
      default:
        return code; // return the code itself as a fallback message
    }
  }

  /// Returns a fallback error message based on the failure code
  static String _getFallback(String code) {
    switch (code) {
      case 'locale_update_failure':
        return 'Failed to update language. Please try again.';
      case 'network_error':
        return 'Network error occurred. Please check your internet connection.';
      case 'data_parsing_error':
        return 'Error processing data. Please try again later.';
      case 'timeout':
        return 'Request timeout. Please try again.';
      case 'server_error':
        return 'Server error occurred. Please try again later.';
      case 'unauthorized':
        return 'Access denied. Please check your credentials.';
      case 'not_found':
        return 'Requested resource not found.';
      // Home-specific errors
      case 'home_null_data':
        return 'No data received from the server.';
      case 'invalidData':
      case 'home_invalid_data':
        return 'The data received is invalid.';
      case 'notFound':
      case 'home_not_found':
        return 'The requested resource was not found.';
      case 'serverError':
      case 'home_server_error':
        return 'An internal server error occurred.';
      case 'failedRequest':
      case 'home_failed_request':
        return 'The request failed to complete.';
      case 'unexpectedError':
      case 'home_unexpected_error':
        return 'An unexpected error occurred.';
      case 'formatError':
      case 'home_format_error':
        return 'Data format error occurred.';
      case 'noData':
      case 'home_no_data':
        return 'No data available to display.';
      // Settings-specific errors
      case 'settings_initialization_failure':
        return 'Failed to initialize settings. Please try again.';
      case 'settings_load_failure':
        return 'Failed to load settings. Please try again.';
      case 'theme_update_failure':
        return 'Failed to update theme. Please try again.';
      default:
        return code; // return the code itself as a fallback message
    }
  }

  /// Formats an error code by replacing underscores followed by lowercase letters
  /// with their uppercase equivalents.
  ///
  /// e.g. 'home_null_data' becomes 'homeNullData'
  ///
  /// This is used to map error codes to their corresponding localized strings.
  static String _formatErrorKey(String code) {
    return code.replaceAllMapped(
      RegExp(r'_([a-z])'),
      (match) => match.group(1)!.toUpperCase(),
    );
  }
}
