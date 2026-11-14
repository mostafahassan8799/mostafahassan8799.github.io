import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubit/theme_cubit.dart';
import 'common.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
    required this.name,
    required this.title,
    required this.sections,
    required this.onNavigate,
  });

  final String name;
  final String title;
  final List<String> sections;
  final ValueChanged<String> onNavigate;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final showLinks = MediaQuery.sizeOf(context).width >= 760;

    return Material(
      color: palette.background.withValues(alpha: 0.95),
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: palette.border)),
        ),
        child: ContentWidth(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onNavigate('top'),
                  child: Text.rich(
                    TextSpan(
                      text: name,
                      children: [
                        if (MediaQuery.sizeOf(context).width >= 520)
                          TextSpan(
                            text: '  ·  $title',
                            style: TextStyle(
                              color: palette.muted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              if (showLinks)
                for (final section in sections)
                  TextButton(
                    onPressed: () => onNavigate(section),
                    style: TextButton.styleFrom(
                      foregroundColor: palette.muted,
                    ),
                    child: Text(section),
                  ),
              const SizedBox(width: 8),
              Tooltip(
                message: isDark ? 'Light mode' : 'Dark mode',
                child: IconButton.outlined(
                  onPressed: () => context.read<ThemeCubit>().toggle(),
                  style: IconButton.styleFrom(
                    side: BorderSide(color: palette.border),
                  ),
                  icon: Icon(
                    isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
