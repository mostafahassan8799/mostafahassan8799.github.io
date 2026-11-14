import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/link_launcher.dart';
import '../../domain/entities.dart';
import 'common.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      itemCount: projects.length,
      columnsForWidth: (w) => w >= 960 ? 3 : (w >= 640 ? 2 : 1),
      spanFor: (i) => projects[i].featured ? 2 : 1,
      itemBuilder: (context, i) => ProjectCard(project: projects[i]),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _AppIcon(project: project),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      project.category,
                      style: TextStyle(fontSize: 13, color: palette.muted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final m in project.metrics) MetricChip(m)],
          ),
          if (project.screenshots.isNotEmpty) ...[
            const SizedBox(height: 16),
            _Screenshots(urls: project.screenshots),
          ],
          const SizedBox(height: 14),
          for (final h in project.highlights) _Bullet(h),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [for (final s in project.stack) TagChip(s)],
          ),
          if (project.links.isNotEmpty) ...[
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final link in project.links)
                  OutlinedButton(
                    onPressed: () => openLink(link.url),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: palette.text,
                      backgroundColor: palette.surfaceAlt,
                      side: BorderSide(color: palette.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text('${link.label} ↗'),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: palette.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.5, height: 1.5, color: palette.muted),
            ),
          ),
        ],
      ),
    );
  }
}

/// Store icon with a gradient + initials fallback.
class _AppIcon extends StatelessWidget {
  const _AppIcon({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final fallback = Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: project.gradient.map(Color.new).toList(),
        ),
      ),
      child: Text(
        project.initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 19,
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: 52,
        height: 52,
        child: project.iconUrl == null
            ? fallback
            : Image.network(
                project.iconUrl!,
                fit: BoxFit.cover,
                // Store CDNs don't send CORS headers; fall back to an <img>
                // element on web instead of failing.
                webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                errorBuilder: (_, __, ___) => fallback,
              ),
      ),
    );
  }
}

/// Horizontal strip of store screenshots.
class _Screenshots extends StatelessWidget {
  const _Screenshots({required this.urls});

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: palette.border),
            color: palette.surfaceAlt,
          ),
          clipBehavior: Clip.antiAlias,
          width: 102,
          child: Image.network(
            urls[i],
            fit: BoxFit.cover,
            webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
