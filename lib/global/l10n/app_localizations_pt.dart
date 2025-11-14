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

  @override
  String get homeWelcome => 'Bem-vindo ao Tech_C';

  @override
  String get homeListTitle => 'Encontre seu Pokémon favorito e explore seus detalhes!';

  @override
  String get errorLocaleUpdateFailure => 'Falha ao atualizar idioma. Tente novamente.';

  @override
  String get errorNetworkError => 'Erro de rede. Verifique sua conexão com a internet.';

  @override
  String get errorDataParsingError => 'Erro ao processar dados. Tente novamente mais tarde.';

  @override
  String get errorTimeout => 'Tempo limite da requisição. Tente novamente.';

  @override
  String get errorServerError => 'Erro no servidor. Tente novamente mais tarde.';

  @override
  String get errorUnauthorized => 'Acesso negado. Verifique suas credenciais.';

  @override
  String get errorNotFound => 'Recurso solicitado não encontrado.';

  @override
  String get errorUnknown => 'Ocorreu um erro inesperado. Tente novamente.';

  @override
  String get homeErrorNullData => 'Nenhum dado foi recebido do servidor.';

  @override
  String get homeErrorInvalidData => 'Os dados recebidos são inválidos.';

  @override
  String get homeErrorNotFound => 'O recurso solicitado não foi encontrado.';

  @override
  String get homeErrorServerError => 'Ocorreu um erro interno no servidor.';

  @override
  String get homeErrorFailedRequest => 'A solicitação falhou ao ser concluída.';

  @override
  String get homeErrorUnexpectedError => 'Ocorreu um erro inesperado.';

  @override
  String get homeErrorFormatError => 'Ocorreu um erro de formato nos dados.';

  @override
  String get homeErrorNoData => 'Nenhum dado disponível para exibir.';

  @override
  String get errorSettingsInitializationFailure => 'Falha ao inicializar configurações. Tente novamente.';

  @override
  String get errorSettingsLoadFailure => 'Falha ao carregar configurações. Tente novamente.';

  @override
  String get errorThemeUpdateFailure => 'Falha ao atualizar tema. Tente novamente.';
}
