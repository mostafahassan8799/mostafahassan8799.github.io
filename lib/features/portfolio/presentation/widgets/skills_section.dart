import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities.dart';
import 'common.dart';

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key, required this.skills, required this.education});

  final List<SkillGroup> skills;
  final String education;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveGrid(
          spacing: 14,
          itemCount: skills.length,
          columnsForWidth: (w) => w >= 960 ? 4 : (w >= 560 ? 2 : 1),
          itemBuilder: (context, i) {
            final group = skills[i];
            return Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: palette.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: palette.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [for (final s in group.items) TagChip(s)],
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 22),
        Text(education, style: TextStyle(fontSize: 14.5, color: palette.muted)),
      ],
    );
  }
}
