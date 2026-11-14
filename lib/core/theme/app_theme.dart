import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens exposed through [ThemeExtension] so widgets never hard-code
/// colors and both themes stay in sync.
@immutable
class PortfolioPalette extends ThemeExtension<PortfolioPalette> {
  const PortfolioPalette({
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.text,
    required this.muted,
    required this.accent,
    required this.accentAlt,
  });

  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color text;
  final Color muted;
  final Color accent;
  final Color accentAlt;

  Color get accentSoft => accent.withValues(alpha: 0.12);

  LinearGradient get gradient => LinearGradient(colors: [accent, accentAlt]);

  static const light = PortfolioPalette(
    background: Color(0xFFF7F8FB),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFEEF2F8),
    border: Color(0xFFE2E7F0),
    text: Color(0xFF0F172A),
    muted: Color(0xFF5B6478),
    accent: Color(0xFF0277D6),
    accentAlt: Color(0xFF13B9FD),
  );

  static const dark = PortfolioPalette(
    background: Color(0xFF0A0F1A),
    surface: Color(0xFF111827),
    surfaceAlt: Color(0xFF172033),
    border: Color(0xFF1F2A3D),
    text: Color(0xFFE8EDF6),
    muted: Color(0xFF94A0B8),
    accent: Color(0xFF4FB3FF),
    accentAlt: Color(0xFF54C5F8),
  );

  @override
  PortfolioPalette copyWith({
    Color? background,
    Color? surface,
    Color? surfaceAlt,
    Color? border,
    Color? text,
    Color? muted,
    Color? accent,
    Color? accentAlt,
  }) {
    return PortfolioPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      border: border ?? this.border,
      text: text ?? this.text,
      muted: muted ?? this.muted,
      accent: accent ?? this.accent,
      accentAlt: accentAlt ?? this.accentAlt,
    );
  }

  @override
  PortfolioPalette lerp(ThemeExtension<PortfolioPalette>? other, double t) {
    if (other is! PortfolioPalette) return this;
    return PortfolioPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentAlt: Color.lerp(accentAlt, other.accentAlt, t)!,
    );
  }
}

/// Monospace style kept in the theme so tests can run without network fonts.
@immutable
class PortfolioTypography extends ThemeExtension<PortfolioTypography> {
  const PortfolioTypography({required this.mono});

  final TextStyle mono;

  @override
  PortfolioTypography copyWith({TextStyle? mono}) =>
      PortfolioTypography(mono: mono ?? this.mono);

  @override
  PortfolioTypography lerp(
    ThemeExtension<PortfolioTypography>? other,
    double t,
  ) {
    if (other is! PortfolioTypography) return this;
    return t < 0.5 ? this : other;
  }
}

abstract final class AppTheme {
  static ThemeData light({bool useGoogleFonts = true}) =>
      _build(Brightness.light, PortfolioPalette.light, useGoogleFonts);

  static ThemeData dark({bool useGoogleFonts = true}) =>
      _build(Brightness.dark, PortfolioPalette.dark, useGoogleFonts);

  static ThemeData _build(
    Brightness brightness,
    PortfolioPalette palette,
    bool useGoogleFonts,
  ) {
    final base = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.accent,
        brightness: brightness,
      ),
    );

    final textTheme = (useGoogleFonts
            ? GoogleFonts.interTextTheme(base.textTheme)
            : base.textTheme)
        .apply(bodyColor: palette.text, displayColor: palette.text);

    final mono = useGoogleFonts
        ? GoogleFonts.jetBrainsMono()
        : const TextStyle(fontFamily: 'monospace');

    return base.copyWith(
      scaffoldBackgroundColor: palette.background,
      textTheme: textTheme,
      extensions: [palette, PortfolioTypography(mono: mono)],
    );
  }
}

extension ThemeX on BuildContext {
  PortfolioPalette get palette => Theme.of(this).extension<PortfolioPalette>()!;

  TextStyle get mono => Theme.of(this).extension<PortfolioTypography>()!.mono;

  TextTheme get text => Theme.of(this).textTheme;
}
