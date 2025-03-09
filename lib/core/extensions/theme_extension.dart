import 'package:flutter/material.dart';
import 'package:stratagile_todo_test/core/theme/typography_theme_extension.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TypographyThemeExtension get typography =>
      theme.extension<TypographyThemeExtension>()!;
}
