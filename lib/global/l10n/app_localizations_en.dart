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
  String homeNoResultsFound(Object query) {
    return 'No results found for \"$query\"';
  }

  @override
  String get filterByType => 'Filter by Type';

  @override
  String filteringBy(Object type) {
    return 'Filtering by: $type';
  }

  @override
  String get clearFilter => 'Clear Filter';

  @override
  String get searchPokemon => 'Search Pokémon';

  @override
  String get errorLocaleUpdateFailure => 'Failed to update language. Please try again.';

  @override
  String get errorNetworkError => 'Network error occurred. Please check your internet connection.';

  @override
  String get errorDataParsingError => 'Error processing data. Please try again later.';

  @override
  String get errorTimeout => 'Request timeout. Please try again.';

  @override
  String get errorServerError => 'Server error occurred. Please try again later.';

  @override
  String get errorUnauthorized => 'Access denied. Please check your credentials.';

  @override
  String get errorNotFound => 'Requested resource not found.';

  @override
  String get errorUnknown => 'An unexpected error occurred. Please try again.';

  @override
  String get homeErrorNullData => 'No data received from the server.';

  @override
  String get homeErrorInvalidData => 'The data received is invalid.';

  @override
  String get homeErrorNotFound => 'The requested resource was not found.';

  @override
  String get homeErrorServerError => 'An internal server error occurred.';

  @override
  String get homeErrorFailedRequest => 'The request failed to complete.';

  @override
  String get homeErrorUnexpectedError => 'An unexpected error occurred.';

  @override
  String get homeErrorFormatError => 'Data format error occurred.';

  @override
  String get homeErrorNoData => 'No data available to display.';

  @override
  String get errorSettingsInitializationFailure => 'Failed to initialize settings. Please try again.';

  @override
  String get errorSettingsLoadFailure => 'Failed to load settings. Please try again.';

  @override
  String get errorThemeUpdateFailure => 'Failed to update theme. Please try again.';

  @override
  String get pokemonHeight => 'Height';

  @override
  String get pokemonWeight => 'Weight';

  @override
  String get pokemonType => 'Type:';

  @override
  String get pokemonTypes => 'Types:';

  @override
  String get pokemonCandy => 'Candy:';

  @override
  String get pokemonCandyCount => 'Candy Count: ';

  @override
  String get pokemonMultipliers => 'Multipliers:';

  @override
  String get pokemonWeakness => 'Weakness:';

  @override
  String get pokemonWeaknesses => 'Weaknesses:';

  @override
  String get pokemonInformations => 'Informations';

  @override
  String get pokemonEgg => 'Egg:';

  @override
  String get pokemonSpawnChance => 'Spawn Chance:';

  @override
  String get pokemonAvgSpawns => 'Avg Spawns:';

  @override
  String get pokemonSpawnTime => 'Spawn Time:';

  @override
  String get pokemonPreviousEvolution => 'Previous Evolution';

  @override
  String get pokemonNextEvolution => 'Next Evolution';
}
