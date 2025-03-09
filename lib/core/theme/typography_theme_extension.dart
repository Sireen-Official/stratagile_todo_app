import 'package:flutter/material.dart';

final class TypographyThemeExtension
    extends ThemeExtension<TypographyThemeExtension> {
  const TypographyThemeExtension({
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.button,
    required this.label,
  });

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle button;
  final TextStyle label;

  @override
  ThemeExtension<TypographyThemeExtension> copyWith({
    TextStyle? display,
    TextStyle? headline,
    TextStyle? title,
    TextStyle? body,
    TextStyle? button,
    TextStyle? label,
  }) {
    return TypographyThemeExtension(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      title: title ?? this.title,
      body: body ?? this.body,
      button: button ?? this.button,
      label: label ?? this.label,
    );
  }

  @override
  ThemeExtension<TypographyThemeExtension> lerp(
      covariant ThemeExtension<TypographyThemeExtension>? other, double t) {
    if (other is! TypographyThemeExtension) {
      return this;
    }
    return TypographyThemeExtension(
      display: TextStyle.lerp(display, other.display, t)!,
      headline: TextStyle.lerp(headline, other.headline, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
    );
  }
}