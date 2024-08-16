import 'package:cv_flutter/theme/theme_base.dart';
import 'package:flutter/material.dart';

final lightTheme = CustomTheme(
  mainBackground: Colors.white,
  cardBackground: Color(0xffF1F1F1),
  accent: Colors.deepPurple,
  primaryFont: Colors.black87,
  secondaryFont: Colors.black45,
);

final darkTheme = CustomTheme(
  mainBackground: Color(0xff181818),
  cardBackground: Color(0xff2A2A2A),
  accent: Colors.lightBlue,
  primaryFont: Colors.white,
  secondaryFont: Colors.white54,
);

extension CustomThemeExtension on ThemeData {
  CustomTheme get custom {
    switch (brightness) {
      case Brightness.dark:
        return darkTheme;
      case Brightness.light:
        return lightTheme;
    }
  }

  TextStyle get textStylePrimary {
    return TextStyle(
      color: custom.primaryFont,
    );
  }

  TextStyle get textStyleSecondary {
    return TextStyle(
      color: custom.secondaryFont,
    );
  }

  TextStyle get textStyleAccent {
    return TextStyle(
      color: custom.accent,
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle modify({
    double? opacity,
    double? fontSize,
  }) {
    return copyWith(
      color: opacity == null ? null : color?.withOpacity(opacity),
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
