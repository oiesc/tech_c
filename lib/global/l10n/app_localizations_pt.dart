// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appErrorInitializing => 'Erro ao inicializar aplicativo';

  @override
  String get appTryAgain => 'Tentar Novamente';

  @override
  String get appVersion => 'Versão';

  @override
  String get appName => 'Nome do App';

  @override
  String get navHome => 'Início';

  @override
  String get homeWelcome => 'Bem-vindo ao Tech_C';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsThemeSection => 'Tema';

  @override
  String get settingsLanguageSection => 'Idioma';

  @override
  String get settingsAppInfoSection => 'Informações do App';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguagePortuguese => 'Português';

  @override
  String settingsErrorLoading(Object error) {
    return 'Erro ao carregar configurações: $error';
  }

  @override
  String get settingsRetry => 'Tentar Novamente';
}
