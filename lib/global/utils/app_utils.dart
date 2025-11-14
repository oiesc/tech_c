import 'dart:math';

import 'package:flutter/material.dart';

export 'app_failure_message.dart';
export 'app_info.dart';
export 'app_logger.dart';
export 'extensions/string_extension.dart';

class AppUtils {
  static Color? _lastColor;

  static Color getRandomColor() {
    final random = Random();
    Color newColor;

    do {
      newColor = HSVColor.fromAHSV(
        1,
        random.nextDouble() * 360,
        0.85,
        0.95,
      ).toColor();
    } while (_lastColor != null && _areColorsSimilar(_lastColor!, newColor));

    _lastColor = newColor;
    return newColor;
  }

  static bool _areColorsSimilar(Color c1, Color c2) {
    final dR = (c1.r * 255).round() - (c2.r * 255).round();
    final dG = (c1.g * 255).round() - (c2.g * 255).round();
    final dB = (c1.b * 255).round() - (c2.b * 255).round();

    return (dR * dR + dG * dG + dB * dB) < 8000;
  }

  static String generateRandomId({int length = 16}) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  static void scrollToTop(ScrollController controller) {
    controller.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
