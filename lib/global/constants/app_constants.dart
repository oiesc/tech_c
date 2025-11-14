import '../utils/app_info.dart';
import 'app_config.dart';

/// App wide constants
class AppConstants {
  /// [App Info]
  static String get appName => AppConfig.appName;
  static String get appVersion => AppInfo.version;
  static String get buildNumber => AppInfo.buildNumber;

  /// [API Configuration]
  static String get baseUrl => AppConfig.apiBaseUrl;
  static int get connectionTimeout => AppConfig.connectionTimeout;
  static int get receiveTimeout => AppConfig.receiveTimeout;

  /// [Animation Durations]
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  /// [Spacing]
  /// 4
  static const double tinySpacing = 4.0;

  /// 8
  static const double smallSpacing = 8.0;

  /// 16
  static const double mediumSpacing = 16.0;

  /// 24
  static const double largeSpacing = 24.0;

  /// 32
  static const double extraLargeSpacing = 32.0;

  /// [Border Radius]
  /// 4
  static const double smallRadius = 4.0;

  /// 8
  static const double mediumRadius = 8.0;

  /// 16
  static const double largeRadius = 16.0;

  /// 24
  static const double extraLargeRadius = 24.0;

  // Icon Sizes
  /// 16
  static const double smallIconSize = 20.0;

  /// 24
  static const double mediumIconSize = 24.0;

  /// 32
  static const double largeIconSize = 32.0;

  /// 40
  static const double extraLargeIconSize = 40.0;

  /// 64
  static const double hugeIconSize = 64.0;
}
