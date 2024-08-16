// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  CustomTheme({
    required this.mainBackground,
    required this.cardBackground,
    required this.accent,
    required this.primaryFont,
    required this.secondaryFont,
  });

  final Color mainBackground;
  final Color cardBackground;
  final Color accent;
  final Color primaryFont;
  final Color secondaryFont;

  @override
  ThemeExtension<CustomTheme> copyWith({
    final Color? mainBackground,
    final Color? cardBackground,
    final Color? accent,
    final Color? primaryFont,
    final Color? secondaryFont,
  }) {
    return CustomTheme(
      mainBackground: mainBackground ?? this.mainBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      accent: accent ?? this.accent,
      primaryFont: primaryFont ?? this.primaryFont,
      secondaryFont: secondaryFont ?? this.secondaryFont,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(covariant ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }

    return CustomTheme(
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      primaryFont: Color.lerp(primaryFont, other.primaryFont, t)!,
      secondaryFont: Color.lerp(secondaryFont, other.secondaryFont, t)!,
    );
  }
}
