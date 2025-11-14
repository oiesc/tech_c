import Flutter
import UIKit
import FirebaseCore
import FirebaseAnalytics

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller = window?.rootViewController as! FlutterViewController
    let analyticsChannel = FlutterMethodChannel(
      name: "app.analytics.channel",
      binaryMessenger: controller.binaryMessenger
    )
    
    analyticsChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "logEvent":
        self.handleLogEvent(call: call, result: result)
      case "setUserId":
        self.handleSetUserId(call: call, result: result)
      case "setUserProperty":
        self.handleSetUserProperty(call: call, result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func handleLogEvent(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
          let eventName = args["name"] as? String else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "Event name is required", details: nil))
      return
    }
    
    let parameters = args["parameters"] as? [String: Any]
    Analytics.logEvent(eventName, parameters: parameters)
    result(nil)
  }
  
  private func handleSetUserId(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let userId = call.arguments as? String else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "User ID is required", details: nil))
      return
    }
    
    Analytics.setUserID(userId)
    result(nil)
  }
  
  private func handleSetUserProperty(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
          let name = args["name"] as? String,
          let value = args["value"] as? String else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "Property name and value are required", details: nil))
      return
    }
    
    Analytics.setUserProperty(value, forName: name)
    result(nil)
  }
}