import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities.dart';
import 'common.dart';

class CaseStudiesGrid extends StatelessWidget {
  const CaseStudiesGrid({super.key, required this.caseStudies});

  final List<CaseStudy> caseStudies;

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      itemCount: caseStudies.length,
      columnsForWidth: (w) => w < 820 ? 1 : 2,
      itemBuilder: (context, i) => _CaseCard(caseStudies[i]),
    );
  }
}

class _CaseCard extends StatelessWidget {
  const _CaseCard(this.caseStudy);

  final CaseStudy caseStudy;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return HoverCard(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientText(
            caseStudy.headline,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              height: 1,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            caseStudy.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          for (final p in caseStudy.paragraphs)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                p,
                style: TextStyle(fontSize: 15, height: 1.6, color: palette.muted),
              ),
            ),
        ],
      ),
    );
  }
}
