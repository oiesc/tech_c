class AppGenericFailure {
  final String message;
  final String code;
  final String? title;
  final Object? error;
  final StackTrace? stackTrace;

  AppGenericFailure({
    required this.message,
    required this.code,
    this.title,
    this.error,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'AppGenericFailure{message: $message, code: $code, title: $title, error: ${error.toString()}}';
  }
}
