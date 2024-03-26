import 'package:flutter/material.dart';

import 'color_themes.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: ColorThemes.primaryColor,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: ColorThemes.primaryColor,
    cardColor: ColorThemes.whiteColor,
    errorColor: ColorThemes.redColor,
  ),
  iconTheme: IconThemeData(
    color: ColorThemes.primaryColor,
    size: 24,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: ColorThemes.blackColor,
  ),
);
