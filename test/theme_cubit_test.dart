import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/portfolio/presentation/cubit/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    test('starts in dark mode', () {
      final cubit = ThemeCubit();
      expect(cubit.state, ThemeMode.dark);
      cubit.close();
    });

    test('toggle switches dark -> light -> dark', () {
      final cubit = ThemeCubit()..toggle();
      expect(cubit.state, ThemeMode.light);
      cubit.toggle();
      expect(cubit.state, ThemeMode.dark);
      cubit.close();
    });
  });
}
