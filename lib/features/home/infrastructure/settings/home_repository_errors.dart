import '../../../../global/utils/app_failure_message.dart';

enum HomeRepositoryErrors {
  formatError,
  unexpectedError;

  String get message {
    return AppFailureMessage.get(code);
  }

  String get code => 'home$name';
}
