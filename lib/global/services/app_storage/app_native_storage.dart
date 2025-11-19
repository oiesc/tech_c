import 'package:flutter/services.dart';

import '../../utils/app_utils.dart';

class AppNativeStorage {
  static const MethodChannel _channel = MethodChannel('app.cache.channel');

  static Future<void> saveOnCache({
    required String key,
    required String value,
  }) async {
    try {
      await _channel.invokeMethod('saveFileOnCache', {'key': key, 'value': value});
    } on PlatformException catch (e) {
      AppLogger.error('Error logging event: ${e.message}');
    }
  }

  static Future<String?> getFromCache(String key) async {
    try {
      final String? value = await _channel.invokeMethod('getFileFromCache', {'key': key});
      return value;
    } on PlatformException catch (e) {
      AppLogger.error('Error getting cached file: ${e.message}');
      return null;
    }
  }
}
