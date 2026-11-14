import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the current [ThemeMode]. Starts dark, toggles between dark and light.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({ThemeMode initial = ThemeMode.dark}) : super(initial);

  void toggle() =>
      emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
}
