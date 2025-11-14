import 'package:package_info_plus/package_info_plus.dart';

/// Utility class to manage app information from pubspec.yaml
class AppInfo {
  static PackageInfo? _packageInfo;
  
  /// Initialize package info
  static Future<void> initialize() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }
  
  /// Get app name
  static String get appName {
    return _packageInfo?.appName ?? 'Flutter Base Project';
  }
  
  /// Get app version
  static String get version {
    return _packageInfo?.version ?? '1.0.0';
  }
  
  /// Get build number
  static String get buildNumber {
    return _packageInfo?.buildNumber ?? '1';
  }
  
  /// Get full version string (version + build number)
  static String get fullVersion {
    return '$version+$buildNumber';
  }
  
  /// Get package name
  static String get packageName {
    return _packageInfo?.packageName ?? 'com.project.domain.techc';
  }
}
