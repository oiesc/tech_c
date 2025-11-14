import 'dart:async';

import '../constants/app_constants.dart';

class Debouncer {
  final Duration? delay;
  Timer? _timer;

  Debouncer({this.delay});

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay ?? AppConstants.mediumAnimationDuration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
