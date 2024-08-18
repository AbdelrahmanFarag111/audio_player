import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:aduio_player/data/services/hive_box.dart';

class Themes {
  static final List<ThemeColor> _themes = [
    DarkTheme(),
  ];

  static final List<String> _themeNames = [
    'dark',
  ];

  static get themes => _themes;
  static List<String> get themeNames => _themeNames;

  static ThemeColor getThemeFromKey(String key) {
    switch (key) {
      case 'dark':
        return _themes[0];
      default:
        return _themes[0];
    }
  }

  static Future<void> setTheme(String themeName) async {
    final Box<dynamic> box = Hive.box(HiveBox.boxName);
    await box.put(HiveBox.themeKey, themeName);
  }

  static String getThemeName() {
    final Box<dynamic> box = Hive.box(HiveBox.boxName);
    final String? themeName = box.get(HiveBox.themeKey) as String?;
    return themeName ?? 'dark';
  }

  static ThemeColor getTheme() {
    final Box<dynamic> box = Hive.box(HiveBox.boxName);
    final String? themeName = box.get(HiveBox.themeKey) as String?;
    return getThemeFromKey(themeName ?? 'dark');
  }
}

abstract class ThemeColor {
  final String themeName;
  final Color primaryColor;
  final Color secondaryColor;
  final ColorScheme colorScheme;
  final LinearGradient linearGradient;

  const ThemeColor({
    required this.themeName,
    required this.primaryColor,
    required this.secondaryColor,
    required this.colorScheme,
    required this.linearGradient,
  });
}

class DarkTheme extends ThemeColor {
  DarkTheme()
      : super(
          themeName: 'dark',
          primaryColor: const Color(0xff000328),
          secondaryColor: const Color(0xFF00458e),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
          linearGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff000328),
              Color(0xFF00458e),
            ],
          ),
        );
}

