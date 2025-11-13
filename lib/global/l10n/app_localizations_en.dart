// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appErrorInitializing => 'Error initializing app';

  @override
  String get appTryAgain => 'Try Again';

  @override
  String get appVersion => 'Version';

  @override
  String get appName => 'App Name';

  @override
  String get navHome => 'Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsThemeSection => 'Theme';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsAppInfoSection => 'App Information';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguagePortuguese => 'Português';

  @override
  String settingsErrorLoading(Object error) {
    return 'Error loading settings: $error';
  }

  @override
  String get settingsRetry => 'Retry';

  @override
  String get homeWelcome => 'Welcome to Tech_C';

  @override
  String get homeListTitle => 'Find your favorite Pokemon and explore their details!';
}
