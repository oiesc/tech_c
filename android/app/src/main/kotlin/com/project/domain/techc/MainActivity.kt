package com.project.domain.techc

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import com.google.firebase.analytics.FirebaseAnalytics

class MainActivity: FlutterActivity() {

    private val CHANNEL = "app.analytics.channel"
    private lateinit var analytics: FirebaseAnalytics

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        analytics = FirebaseAnalytics.getInstance(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "logEvent" -> handleLogEvent(call, result)
                    "setUserId" -> handleSetUserId(call, result)
                    "setUserProperty" -> handleSetUserProperty(call, result)
                    else -> result.notImplemented()
                }
            }
    }

    private fun handleLogEvent(call: MethodCall, result: Result) {
        try {
            val args = call.arguments as? Map<*, *> ?: run {
                result.error("INVALID_ARGUMENT", "Event arguments must be a map", null)
                return
            }

            val eventName = args["name"] as? String ?: run {
                result.error("INVALID_ARGUMENT", "Event name is required", null)
                return
            }

            val parameters = args["parameters"] as? Map<*, *>
            val bundle = Bundle()

            parameters?.forEach { (key, value) ->
                val keyStr = key as? String ?: return@forEach
                when (value) {
                    is String -> bundle.putString(keyStr, value)
                    is Int -> bundle.putInt(keyStr, value)
                    is Long -> bundle.putLong(keyStr, value)
                    is Double -> bundle.putDouble(keyStr, value)
                    is Float -> bundle.putFloat(keyStr, value)
                    is Boolean -> bundle.putBoolean(keyStr, value)
                }
            }

            analytics.logEvent(eventName, bundle)
            result.success(null)
        } catch (e: Exception) {
            result.error("ERROR", "Failed to log event: ${e.message}", null)
        }
    }

    private fun handleSetUserId(call: MethodCall, result: Result) {
        try {
            val userId = call.arguments as? String ?: run {
                result.error("INVALID_ARGUMENT", "User ID is required", null)
                return
            }

            analytics.setUserId(userId)
            result.success(null)
        } catch (e: Exception) {
            result.error("ERROR", "Failed to set user ID: ${e.message}", null)
        }
    }

    private fun handleSetUserProperty(call: MethodCall, result: Result) {
        try {
            val args = call.arguments as? Map<*, *> ?: run {
                result.error("INVALID_ARGUMENT", "Arguments must be a map", null)
                return
            }

            val name = args["name"] as? String ?: run {
                result.error("INVALID_ARGUMENT", "Property name is required", null)
                return
            }

            val value = args["value"] as? String ?: run {
                result.error("INVALID_ARGUMENT", "Property value is required", null)
                return
            }

            analytics.setUserProperty(name, value)
            result.success(null)
        } catch (e: Exception) {
            result.error("ERROR", "Failed to set user property: ${e.message}", null)
        }
    }
}
