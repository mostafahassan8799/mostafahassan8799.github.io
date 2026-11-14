import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/link_launcher.dart';
import '../../domain/entities.dart';
import 'common.dart';

const kSourceUrl =
    'https://github.com/mostafahassan8799/mostafahassan8799.github.io';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isNarrow = MediaQuery.sizeOf(context).width < 720;

    return ContentWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 72),
        child: LoopingValue(
          duration: const Duration(seconds: 6),
          builder: (context, t, child) => Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 48,
              horizontal: isNarrow ? 20 : 32,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment(-1 + t, -1),
                end: Alignment(1 - t, 1),
                colors: [palette.accent, palette.accentAlt],
              ),
            ),
            child: child,
          ),
          child: Column(
            children: [
              Text(
                "Let's build something solid.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isNarrow ? 26 : 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Open to conversations about Senior Flutter and mobile roles.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  PillButton(
                    label: profile.email,
                    icon: Icons.mail_outline_rounded,
                    background: Colors.white,
                    foreground: const Color(0xFF0A2540),
                    onPressed: () => openLink('mailto:${profile.email}'),
                  ),
                  PillButton(
                    label: 'LinkedIn ↗',
                    background: Colors.white.withValues(alpha: 0.16),
                    foreground: Colors.white,
                    onPressed: () => openLink(profile.linkedInUrl),
                  ),
                  PillButton(
                    label: 'GitHub ↗',
                    background: Colors.white.withValues(alpha: 0.16),
                    foreground: Colors.white,
                    onPressed: () => openLink(profile.gitHubUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, left: 20, right: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 6,
        children: [
          Text(
            '© ${DateTime.now().year} $name · Built with',
            style: TextStyle(color: palette.muted, fontSize: 13.5),
          ),
          const FlutterLogo(size: 14),
          Text(
            'Flutter, Bloc & Clean Architecture ·',
            style: TextStyle(color: palette.muted, fontSize: 13.5),
          ),
          InkWell(
            onTap: () => openLink(kSourceUrl),
            child: Text(
              'View source',
              style: TextStyle(
                color: palette.accent,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
