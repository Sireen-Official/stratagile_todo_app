import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stratagile_todo_test/core/theme/typography_theme_extension.dart';

part 'theme.freezed.dart';
part 'theme.g.dart';

final class AppTheme {
  const AppTheme();

  ColorScheme lightScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color(0xff4A3780),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ColorScheme darkScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color(0xff4A3780),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    extensions: [
      TypographyThemeExtension(
        display: GoogleFonts.montserrat(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          letterSpacing: 0,
          color: Colors.white,
        ),
        headline: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        title: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Colors.white,
        ),
        body: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.white,
        ),
        button: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
          color: Colors.white,
        ),
        label: GoogleFonts.roboto(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          color: Colors.white,
        ),
      ),
    ],
  );
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(AppTheme()) AppTheme theme,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;
}

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    return const ThemeState();
  }

  void changeTheme(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }
}
