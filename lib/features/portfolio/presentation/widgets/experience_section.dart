import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key, required this.jobs});

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < jobs.length; i++)
          _JobTile(job: jobs[i], isLast: i == jobs.length - 1),
      ],
    );
  }
}

class _JobTile extends StatelessWidget {
  const _JobTile({required this.job, required this.isLast});

  final Job job;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!isLast)
          Positioned(
            left: 7,
            top: 22,
            bottom: 0,
            child: Container(width: 2, color: palette.border),
          ),
        Positioned(
          left: 0,
          top: 4,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: palette.surfaceAlt,
              shape: BoxShape.circle,
              border: Border.all(color: palette.accent, width: 3),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, bottom: isLast ? 0 : 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '${job.title} · ',
                      children: [
                        TextSpan(
                          text: job.company,
                          style: TextStyle(color: palette.accent),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${job.period} · ${job.location}',
                    style: context.mono.copyWith(
                      fontSize: 12.5,
                      color: palette.muted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              for (final b in job.bullets)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    '•  $b',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: palette.muted,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
