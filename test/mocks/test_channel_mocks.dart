import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper para configurar mocks de método channels para testes
class TestChannelMocks {
  /// Configura mock para o analytics channel
  static void setupAnalyticsChannelMock() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('app.analytics.channel'),
      (MethodCall methodCall) async {
        // Mock implementation para analytics methods
        switch (methodCall.method) {
          case 'logEvent':
            return null; // Analytics log event sempre retorna null
          case 'setUserId':
            return null; // Set user ID sempre retorna null
          case 'setUserProperty':
            return null; // Set user property sempre retorna null
          default:
            throw MissingPluginException(
              'No implementation found for method ${methodCall.method} '
              'on channel app.analytics.channel',
            );
        }
      },
    );
  }

  /// Configura mock para o cache channel
  static void setupCacheChannelMock() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('app.cache.channel'),
      (MethodCall methodCall) async {
        // Mock implementation para cache methods
        switch (methodCall.method) {
          case 'saveFileOnCache':
            return null; // Save sempre retorna null
          case 'getFileFromCache':
            return null; // Get retorna null (sem cache)
          default:
            throw MissingPluginException(
              'No implementation found for method ${methodCall.method} '
              'on channel app.cache.channel',
            );
        }
      },
    );
  }

  /// Configura todos os mocks de channels
  static void setupAllChannelMocks() {
    setupAnalyticsChannelMock();
    setupCacheChannelMock();
  }

  /// Remove todos os mock handlers
  static void tearDownChannelMocks() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('app.analytics.channel'),
      null,
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('app.cache.channel'),
      null,
    );
  }
}