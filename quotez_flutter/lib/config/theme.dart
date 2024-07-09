import 'package:flutter/material.dart';

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color colorContainer;
  final Color onColor;
  final Color onColorContainer;
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });

  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final Color seed;
  final Color value;
}

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  List<ExtendedColor> get extendedColors => [];

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffebbcac),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff0c0b0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdfaf9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcccaca),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff0c0b0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161311),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffd9c7c1),
      outlineVariant: Color(0xffd9c7c1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1de),
      inversePrimary: Color(0xff3f2318),
      primaryFixed: Color(0xffffe0d6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff0c0b0),
      onPrimaryFixedVariant: Color(0xff281007),
      secondaryFixed: Color(0xffe9e6e6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcccaca),
      onSecondaryFixedVariant: Color(0xff161616),
      tertiaryFixed: Color(0xffffe0d6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff0c0b0),
      onTertiaryFixedVariant: Color(0xff281007),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff3d3837),
      surfaceContainerLowest: Color(0xff110d0c),
      surfaceContainerLow: Color(0xff1e1b1a),
      surfaceContainer: Color(0xff231f1d),
      surfaceContainerHigh: Color(0xff2d2928),
      surfaceContainerHighest: Color(0xff383432),
    );
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff0c0b0),
      surfaceTint: Color(0xffebbcac),
      onPrimary: Color(0xff281007),
      primaryContainer: Color(0xffb18778),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcccaca),
      onSecondary: Color(0xff161616),
      secondaryContainer: Color(0xff929090),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff0c0b0),
      onTertiary: Color(0xff281007),
      tertiaryContainer: Color(0xffb18778),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161311),
      onSurface: Color(0xfffff9f8),
      onSurfaceVariant: Color(0xffd9c7c1),
      outline: Color(0xffb09f9a),
      outlineVariant: Color(0xff8f807b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1de),
      inversePrimary: Color(0xff614034),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff210b03),
      primaryFixedDim: Color(0xffebbcac),
      onPrimaryFixedVariant: Color(0xff4d2f23),
      secondaryFixed: Color(0xffe4e2e1),
      onSecondaryFixed: Color(0xff111111),
      secondaryFixedDim: Color(0xffc8c6c5),
      onSecondaryFixedVariant: Color(0xff363636),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff210b03),
      tertiaryFixedDim: Color(0xffebbcac),
      onTertiaryFixedVariant: Color(0xff4d2f23),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff3d3837),
      surfaceContainerLowest: Color(0xff110d0c),
      surfaceContainerLow: Color(0xff1e1b1a),
      surfaceContainer: Color(0xff231f1d),
      surfaceContainerHigh: Color(0xff2d2928),
      surfaceContainerHighest: Color(0xff383432),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebbcac),
      surfaceTint: Color(0xffebbcac),
      onPrimary: Color(0xff46291e),
      primaryContainer: Color(0xff6f4c3f),
      onPrimaryContainer: Color(0xfffff5f3),
      secondary: Color(0xffc8c6c5),
      onSecondary: Color(0xff303030),
      secondaryContainer: Color(0xff232323),
      onSecondaryContainer: Color(0xffafaead),
      tertiary: Color(0xffebbcac),
      onTertiary: Color(0xff46291e),
      tertiaryContainer: Color(0xff6f4c3f),
      onTertiaryContainer: Color(0xfffff5f3),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161311),
      onSurface: Color(0xffe9e1de),
      onSurfaceVariant: Color(0xffd4c3bd),
      outline: Color(0xff9d8d88),
      outlineVariant: Color(0xff504440),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e1de),
      inversePrimary: Color(0xff7a5649),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff2e150b),
      primaryFixedDim: Color(0xffebbcac),
      onPrimaryFixedVariant: Color(0xff603f33),
      secondaryFixed: Color(0xffe4e2e1),
      onSecondaryFixed: Color(0xff1b1c1c),
      secondaryFixedDim: Color(0xffc8c6c5),
      onSecondaryFixedVariant: Color(0xff474746),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff2e150b),
      tertiaryFixedDim: Color(0xffebbcac),
      onTertiaryFixedVariant: Color(0xff603f33),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff3d3837),
      surfaceContainerLowest: Color(0xff110d0c),
      surfaceContainerLow: Color(0xff1e1b1a),
      surfaceContainer: Color(0xff231f1d),
      surfaceContainerHigh: Color(0xff2d2928),
      surfaceContainerHighest: Color(0xff383432),
    );
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff361b11),
      surfaceTint: Color(0xff7a5649),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5b3b2f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff19191a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff393939),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff361b11),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b3b2f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2c221e),
      outline: Color(0xff4c403c),
      outlineVariant: Color(0xff4c403c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffffe7df),
      primaryFixed: Color(0xff5b3b2f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff42251b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff434343),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2d2d2d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b3b2f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff42251b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d8d6),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ef),
      surfaceContainer: Color(0xfff5ece9),
      surfaceContainerHigh: Color(0xffefe6e4),
      surfaceContainerHighest: Color(0xffe9e1de),
    );
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b3b2f),
      surfaceTint: Color(0xff7a5649),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff896456),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff19191a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff393939),
      onSecondaryContainer: Color(0xfffdfaf9),
      tertiary: Color(0xff5b3b2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff896456),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff1e1b1a),
      onSurfaceVariant: Color(0xff4c403c),
      outline: Color(0xff6a5c58),
      outlineVariant: Color(0xff867873),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffebbcac),
      primaryFixed: Color(0xff926c5e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff775447),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff757474),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5c5c5c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff926c5e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff775447),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d8d6),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ef),
      surfaceContainer: Color(0xfff5ece9),
      surfaceContainerHigh: Color(0xffefe6e4),
      surfaceContainerHighest: Color(0xffe9e1de),
    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff624034),
      surfaceTint: Color(0xff7a5649),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff896456),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff19191a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff393939),
      onSecondaryContainer: Color(0xffcccaca),
      tertiary: Color(0xff624034),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff896456),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff1e1b1a),
      onSurfaceVariant: Color(0xff504440),
      outline: Color(0xff82746f),
      outlineVariant: Color(0xffd4c3bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffebbcac),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff2e150b),
      primaryFixedDim: Color(0xffebbcac),
      onPrimaryFixedVariant: Color(0xff603f33),
      secondaryFixed: Color(0xffe4e2e1),
      onSecondaryFixed: Color(0xff1b1c1c),
      secondaryFixedDim: Color(0xffc8c6c5),
      onSecondaryFixedVariant: Color(0xff474746),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff2e150b),
      tertiaryFixedDim: Color(0xffebbcac),
      onTertiaryFixedVariant: Color(0xff603f33),
      surfaceDim: Color(0xffe1d8d6),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ef),
      surfaceContainer: Color(0xfff5ece9),
      surfaceContainerHigh: Color(0xffefe6e4),
      surfaceContainerHighest: Color(0xffe9e1de),
    );
  }
}
