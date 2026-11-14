import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/portfolio/data/local_portfolio_repository.dart';
import 'features/portfolio/domain/portfolio_repository.dart';
import 'features/portfolio/presentation/cubit/theme_cubit.dart';
import 'features/portfolio/presentation/pages/home_page.dart';

/// Root widget.
///
/// Dependencies are injected through the constructor so tests can swap the
/// data source or disable runtime font fetching.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({
    super.key,
    this.repository = const LocalPortfolioRepository(),
    this.useGoogleFonts = true,
  });

  final PortfolioRepository repository;
  final bool useGoogleFonts;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PortfolioRepository>.value(
      value: repository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, mode) => MaterialApp(
            title: 'Mostafa Hassan | Senior Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(useGoogleFonts: useGoogleFonts),
            darkTheme: AppTheme.dark(useGoogleFonts: useGoogleFonts),
            themeMode: mode,
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
