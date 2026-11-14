import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/link_launcher.dart';
import '../../domain/entities.dart';
import 'common.dart';

const kSourceUrl =
    'https://github.com/mostafahassan8799/mostafahassan8799.github.io';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final width = MediaQuery.sizeOf(context).width;
    final isNarrow = width < 720;
    final lines = profile.headline.split('\n');

    final headlineStyle = TextStyle(
      fontSize: isNarrow ? 38 : 60,
      height: 1.08,
      fontWeight: FontWeight.w800,
      letterSpacing: isNarrow ? -1.2 : -2,
      color: palette.text,
    );

    return ContentWidth(
      child: Padding(
        padding: EdgeInsets.only(top: isNarrow ? 48 : 88, bottom: 56),
        child: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _Badge(
                    leading: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF22C55E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    label:
                        '${profile.role} @ ${profile.company} · ${profile.location}',
                  ),
                  _Badge(
                    leading: const FlutterLogo(size: 14),
                    label: 'This site is built with Flutter · view source',
                    onTap: () => openLink(kSourceUrl),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(lines.first, style: headlineStyle),
              if (lines.length > 1) GradientText(lines[1], style: headlineStyle),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 660),
                child: Text(
                  profile.summary,
                  style: TextStyle(
                    fontSize: isNarrow ? 16 : 18,
                    height: 1.6,
                    color: palette.muted,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  PillButton(
                    label: 'Get in touch',
                    icon: Icons.mail_outline_rounded,
                    primary: true,
                    onPressed: () => openLink('mailto:${profile.email}'),
                  ),
                  PillButton(
                    label: 'LinkedIn',
                    icon: Icons.work_outline_rounded,
                    onPressed: () => openLink(profile.linkedInUrl),
                  ),
                  PillButton(
                    label: 'GitHub',
                    icon: Icons.code_rounded,
                    onPressed: () => openLink(profile.gitHubUrl),
                  ),
                  PillButton(
                    label: 'Download CV',
                    icon: Icons.download_rounded,
                    onPressed: () => openLink(profile.cvPath),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              ResponsiveGrid(
                spacing: 14,
                itemCount: profile.stats.length,
                columnsForWidth: (w) => w < 640 ? 2 : 4,
                itemBuilder: (context, i) => _StatCard(profile.stats[i]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.leading, required this.label, this.onTap});

  final Widget leading;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Material(
      color: palette.surface,
      shape: StadiumBorder(side: BorderSide(color: palette.border)),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              leading,
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 13, color: palette.muted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard(this.stat);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientText(
            stat.value,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: TextStyle(fontSize: 14, color: context.palette.muted),
          ),
        ],
      ),
    );
  }
}
