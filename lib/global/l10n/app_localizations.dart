import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('pt')];

  /// No description provided for @appErrorInitializing.
  ///
  /// In en, this message translates to:
  /// **'Error initializing app'**
  String get appErrorInitializing;

  /// No description provided for @appTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get appTryAgain;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get appVersion;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'App Name'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsThemeSection.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeSection;

  /// No description provided for @settingsLanguageSection.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageSection;

  /// No description provided for @settingsAppInfoSection.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get settingsAppInfoSection;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsLanguagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get settingsLanguagePortuguese;

  /// No description provided for @settingsErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading settings: {error}'**
  String settingsErrorLoading(Object error);

  /// No description provided for @settingsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get settingsRetry;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Tech_C'**
  String get homeWelcome;

  /// No description provided for @homeListTitle.
  ///
  /// In en, this message translates to:
  /// **'Find your favorite Pokemon and explore their details!'**
  String get homeListTitle;

  /// No description provided for @homeNoResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found for \"{query}\"'**
  String homeNoResultsFound(Object query);

  /// No description provided for @filterByType.
  ///
  /// In en, this message translates to:
  /// **'Filter by Type'**
  String get filterByType;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear Filter'**
  String get clearFilter;

  /// No description provided for @errorLocaleUpdateFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to update language. Please try again.'**
  String get errorLocaleUpdateFailure;

  /// No description provided for @errorNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error occurred. Please check your internet connection.'**
  String get errorNetworkError;

  /// No description provided for @errorDataParsingError.
  ///
  /// In en, this message translates to:
  /// **'Error processing data. Please try again later.'**
  String get errorDataParsingError;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred. Please try again later.'**
  String get errorServerError;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Access denied. Please check your credentials.'**
  String get errorUnauthorized;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Requested resource not found.'**
  String get errorNotFound;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorUnknown;

  /// No description provided for @homeErrorNullData.
  ///
  /// In en, this message translates to:
  /// **'No data received from the server.'**
  String get homeErrorNullData;

  /// No description provided for @homeErrorInvalidData.
  ///
  /// In en, this message translates to:
  /// **'The data received is invalid.'**
  String get homeErrorInvalidData;

  /// No description provided for @homeErrorNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found.'**
  String get homeErrorNotFound;

  /// No description provided for @homeErrorServerError.
  ///
  /// In en, this message translates to:
  /// **'An internal server error occurred.'**
  String get homeErrorServerError;

  /// No description provided for @homeErrorFailedRequest.
  ///
  /// In en, this message translates to:
  /// **'The request failed to complete.'**
  String get homeErrorFailedRequest;

  /// No description provided for @homeErrorUnexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get homeErrorUnexpectedError;

  /// No description provided for @homeErrorFormatError.
  ///
  /// In en, this message translates to:
  /// **'Data format error occurred.'**
  String get homeErrorFormatError;

  /// No description provided for @homeErrorNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available to display.'**
  String get homeErrorNoData;

  /// No description provided for @errorSettingsInitializationFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize settings. Please try again.'**
  String get errorSettingsInitializationFailure;

  /// No description provided for @errorSettingsLoadFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings. Please try again.'**
  String get errorSettingsLoadFailure;

  /// No description provided for @errorThemeUpdateFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to update theme. Please try again.'**
  String get errorThemeUpdateFailure;

  /// No description provided for @pokemonHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get pokemonHeight;

  /// No description provided for @pokemonWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get pokemonWeight;

  /// No description provided for @pokemonType.
  ///
  /// In en, this message translates to:
  /// **'Type:'**
  String get pokemonType;

  /// No description provided for @pokemonTypes.
  ///
  /// In en, this message translates to:
  /// **'Types:'**
  String get pokemonTypes;

  /// No description provided for @pokemonCandy.
  ///
  /// In en, this message translates to:
  /// **'Candy:'**
  String get pokemonCandy;

  /// No description provided for @pokemonCandyCount.
  ///
  /// In en, this message translates to:
  /// **'Candy Count: '**
  String get pokemonCandyCount;

  /// No description provided for @pokemonMultipliers.
  ///
  /// In en, this message translates to:
  /// **'Multipliers:'**
  String get pokemonMultipliers;

  /// No description provided for @pokemonWeakness.
  ///
  /// In en, this message translates to:
  /// **'Weakness:'**
  String get pokemonWeakness;

  /// No description provided for @pokemonWeaknesses.
  ///
  /// In en, this message translates to:
  /// **'Weaknesses:'**
  String get pokemonWeaknesses;

  /// No description provided for @pokemonInformations.
  ///
  /// In en, this message translates to:
  /// **'Informations'**
  String get pokemonInformations;

  /// No description provided for @pokemonEgg.
  ///
  /// In en, this message translates to:
  /// **'Egg:'**
  String get pokemonEgg;

  /// No description provided for @pokemonSpawnChance.
  ///
  /// In en, this message translates to:
  /// **'Spawn Chance:'**
  String get pokemonSpawnChance;

  /// No description provided for @pokemonAvgSpawns.
  ///
  /// In en, this message translates to:
  /// **'Avg Spawns:'**
  String get pokemonAvgSpawns;

  /// No description provided for @pokemonSpawnTime.
  ///
  /// In en, this message translates to:
  /// **'Spawn Time:'**
  String get pokemonSpawnTime;

  /// No description provided for @pokemonPreviousEvolution.
  ///
  /// In en, this message translates to:
  /// **'Previous Evolution'**
  String get pokemonPreviousEvolution;

  /// No description provided for @pokemonNextEvolution.
  ///
  /// In en, this message translates to:
  /// **'Next Evolution'**
  String get pokemonNextEvolution;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
