import '../../../../global/utils/app_utils.dart';

enum HomeRepositoryErrors {
  formatError,
  unexpectedError;

  String get message {
    return AppFailureMessage.get(code);
  }

  String get code => 'home${name.capitalize()}';
}
