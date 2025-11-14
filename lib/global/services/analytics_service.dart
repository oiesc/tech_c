import 'package:flutter/services.dart';

import '../utils/app_utils.dart';

class AnalyticsService {
  static const MethodChannel _channel = MethodChannel('app.analytics.channel');

  static Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      await _channel.invokeMethod('logEvent', {
        'name': name,
        'parameters': parameters,
      });
    } on PlatformException catch (e) {
      AppLogger.error('Error logging event: ${e.message}');
    }
  }

  static Future<void> setUserId(String userId) async {
    try {
      await _channel.invokeMethod('setUserId', userId);
    } on PlatformException catch (e) {
      AppLogger.error('Error setting user ID: ${e.message}');
    }
  }

  static Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    try {
      await _channel.invokeMethod('setUserProperty', {
        'name': name,
        'value': value,
      });
    } on PlatformException catch (e) {
      AppLogger.error('Error setting user property: ${e.message}');
    }
  }

  static Future<void> logScreenView(String screenName) async {
    await logEvent(
      name: 'screen_view',
      parameters: {'screen_name': screenName},
    );
  }

  static Future<void> logSearch(String searchTerm) async {
    await logEvent(
      name: 'search',
      parameters: {'search_term': searchTerm},
    );
  }

  static Future<void> logSelectContent({
    required String contentType,
    required String itemId,
  }) async {
    await logEvent(
      name: 'select_content',
      parameters: {
        'content_type': contentType,
        'item_id': itemId,
      },
    );
  }
}
