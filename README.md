# Mostafa Hassan · Flutter Portfolio

**Live:** https://mostafahassan8799.github.io

My personal portfolio, built entirely with **Flutter Web**, using the same architecture and tooling I use for production mobile apps.

## Tech

- **Flutter Web** (Material 3, responsive layouts for desktop, tablet and phone)
- **Bloc / Cubit** for state (`ThemeCubit` drives dark/light mode)
- **Clean Architecture, feature-first**: `domain` (pure Dart entities + repository contract) → `data` (local implementation) → `presentation` (cubit, pages, widgets)
- **Motion**: scroll-triggered staggered reveals, count-up stats, shimmer gradients and ambient loops, all disabled automatically when the OS asks for reduced motion
- **ThemeExtension** design tokens, so no hard-coded colors in widgets
- **Dependency injection** with `RepositoryProvider`, so the data source can move to Firestore/REST without UI changes
- **Tests**: unit tests for the cubit, widget tests for rendering, the phone layout and theme switching
- **CI/CD**: GitHub Actions runs the tests, builds the web release and deploys to GitHub Pages on every push to `main`

## Structure

```
lib/
├── main.dart
├── app.dart                         # DI + theming root
├── core/
│   ├── theme/app_theme.dart         # palette & typography ThemeExtensions
│   └── utils/link_launcher.dart
└── features/portfolio/
    ├── domain/                      # entities, PortfolioRepository contract
    ├── data/                        # LocalPortfolioRepository
    └── presentation/
        ├── cubit/theme_cubit.dart
        ├── pages/home_page.dart
        └── widgets/                 # hero, projects, timeline, case studies…
```

## Run locally

```bash
flutter pub get
flutter run -d chrome
flutter test
```

## Contact

mostafahassan8799@gmail.com · [LinkedIn](https://www.linkedin.com/in/mostafahassan8799/) · [GitHub](https://github.com/mostafahassan8799)
