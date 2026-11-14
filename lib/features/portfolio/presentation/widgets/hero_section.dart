import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/link_launcher.dart';
import '../../domain/entities.dart';
import 'common.dart';

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
        padding: EdgeInsets.only(top: isNarrow ? 20 : 32, bottom: 56),
        child: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileHeader(profile: profile, isNarrow: isNarrow),
              SizedBox(height: isNarrow ? 28 : 40),
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
                ],
              ),
              const SizedBox(height: 24),
              Text(lines.first, style: headlineStyle),
              if (lines.length > 1)
                ShimmerGradientText(lines[1], style: headlineStyle),
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
          AnimatedCounter(
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

/// LinkedIn-style header: cover image, overlapping avatar, name and title.
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.profile, required this.isNarrow});

  final Profile profile;
  final bool isNarrow;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final avatar = isNarrow ? 104.0 : 168.0;

    final nameBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.name,
          style: TextStyle(
            fontSize: isNarrow ? 26 : 34,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
            color: palette.text,
          ),
        ),
        const SizedBox(height: 2),
        GradientText(
          profile.title,
          style: TextStyle(
            fontSize: isNarrow ? 16 : 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(isNarrow ? 16 : 24),
              child: AspectRatio(
                // The LinkedIn cover is 4:1; BoxFit.fill keeps its proportions.
                aspectRatio: 4,
                child: LoopingValue(
                  duration: const Duration(seconds: 14),
                  child: Image.asset(
                    profile.coverAsset,
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) => DecoratedBox(
                      decoration: BoxDecoration(gradient: palette.gradient),
                    ),
                  ),
                  builder: (context, t, child) => Transform.scale(
                    scale: 1 + 0.06 * t,
                    alignment: Alignment.centerRight,
                    child: child,
                  ),
                ),
              ),
            ),
            Positioned(
              left: isNarrow ? 16 : 32,
              bottom: -avatar / 2,
              child: _PopIn(
                child: Container(
                width: avatar,
                height: avatar,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: palette.background,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    profile.photoAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        ColoredBox(color: palette.surfaceAlt),
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
        // Name sits beside the avatar on wide screens, below it on phones.
        Padding(
          padding: isNarrow
              ? EdgeInsets.only(top: avatar / 2 + 12)
              : EdgeInsets.only(left: 32 + avatar + 20, top: 14),
          child: nameBlock,
        ),
      ],
    );
  }
}

/// Scale + fade entrance for the avatar.
class _PopIn extends StatelessWidget {
  const _PopIn({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.elasticOut,
      child: child,
      builder: (context, v, child) => Opacity(
        opacity: v.clamp(0.0, 1.0),
        child: Transform.scale(scale: 0.6 + 0.4 * v, child: child),
      ),
    );
  }
}
