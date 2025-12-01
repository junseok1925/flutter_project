import 'package:flutter/material.dart';
import 'package:flutter_theme_example/custom_theme.dart';

final lightTheme = _theme(Brightness.light, LightTheme());
final darkTheme = _theme(Brightness.dark, DarkTheme());

ThemeData _theme(Brightness brightness, AppThemeExtension ext) {
  return ThemeData(
    brightness: brightness,
    useMaterial3: true,
    scaffoldBackgroundColor: ext.background,
    colorScheme: ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: ext.main,
    ),
    extensions: [ext],
  );
}

extension BuildContextExtension on BuildContext {
  //
  ThemeData get theme => Theme.of(this);
  AppThemeExtension get appColor => theme.extension<AppThemeExtension>()!;
}
