import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/portfolio/data/local_portfolio_repository.dart';

void main() {
  final profile = const LocalPortfolioRepository().getProfile();

  Future<void> pumpApp(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const PortfolioApp(useGoogleFonts: false));
    await tester.pumpAndSettle();
  }

  testWidgets('renders hero, every app and every job on desktop',
      (tester) async {
    await pumpApp(tester, const Size(1280, 6000));

    expect(find.text('Download CV'), findsOneWidget);
    for (final p in profile.projects) {
      expect(find.text(p.name), findsOneWidget);
    }
    for (final job in profile.jobs) {
      expect(find.textContaining(job.period), findsOneWidget);
    }
  });

  testWidgets('lays out on a phone without overflow', (tester) async {
    await pumpApp(tester, const Size(390, 12000));
    expect(tester.takeException(), isNull);
    expect(find.text('Apps in the hands of real users'), findsOneWidget);
  });

  testWidgets('theme toggle switches to light mode', (tester) async {
    await pumpApp(tester, const Size(1280, 6000));
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );

    await tester.tap(find.byIcon(Icons.light_mode_outlined));
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );
  });
}
