import 'package:flutter/material.dart';

class HomeUtils {
  static final Map<String, Color> _pokemonTypeColors = {
    'Fire': Colors.red,
    'Water': Colors.blue,
    'Grass': Colors.green,
    'Bug': Colors.lightGreen,
    'Electric': Colors.yellow,
    'Poison': Colors.purple,
    'Psychic': Colors.pink,
    'Ground': Colors.brown,
    'Rock': Colors.grey,
    'Ice': Colors.cyan,
    'Dragon': Colors.indigo,
    'Ghost': Colors.deepPurple,
    'Flying': Colors.blueGrey,
    'Normal': Colors.amber,
  };

  static Color getChipColor(String type) {
    return _pokemonTypeColors[type] ?? _generateColor(type);
  }

  static Color getChipTextColor(String type) {
    final backgroundColor = getChipColor(type);
    final brightness = ThemeData.estimateBrightnessForColor(backgroundColor);
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Color _generateColor(String type) {
    final hash = type.hashCode;

    final hue = (hash % 360).toDouble();

    const saturation = 0.75;
    const lightness = 0.55;

    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }
}
