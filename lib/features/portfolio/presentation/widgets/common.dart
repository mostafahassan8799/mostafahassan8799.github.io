import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

const double kMaxContentWidth = 1080;

/// Centers content and caps its width, like a CSS container.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}

/// A page section with an eyebrow label, a title and content.
class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.child,
    this.tinted = false,
  });

  final String eyebrow;
  final String title;
  final Widget child;
  final bool tinted;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 720;
    return Container(
      width: double.infinity,
      color: tinted ? context.palette.surfaceAlt : null,
      padding: EdgeInsets.symmetric(vertical: isNarrow ? 52 : 72),
      child: ContentWidth(
        child: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '// ${eyebrow.toUpperCase()}',
                style: context.mono.copyWith(
                  fontSize: 13,
                  letterSpacing: 1.2,
                  color: context.palette.accent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: context.text.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  fontSize: isNarrow ? 26 : 32,
                ),
              ),
              const SizedBox(height: 28),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

/// Paints text with the accent gradient.
class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          context.palette.gradient.createShader(Offset.zero & bounds.size),
      child: Text(text, style: style),
    );
  }
}

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.primary = false,
    this.background,
    this.foreground,
  });

  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool primary;
  final Color? background;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final bg = background ?? (primary ? palette.accent : palette.surface);
    final fg = foreground ?? (primary ? Colors.white : palette.text);
    final hasBorder = background == null && !primary;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: hasBorder
              ? BorderSide(color: palette.border)
              : BorderSide.none,
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
          // Flexible + ellipsis keeps long labels (e.g. the email) from
          // overflowing on narrow phones.
          Flexible(
            child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: context.palette.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: context.mono.copyWith(
          fontSize: 12,
          color: context.palette.muted,
        ),
      ),
    );
  }
}

class MetricChip extends StatelessWidget {
  const MetricChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: context.palette.accentSoft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: context.palette.accent,
        ),
      ),
    );
  }
}

/// Card that lifts and highlights its border on hover (web/desktop).
class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(22),
    this.interactive = true,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool interactive;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovering = false;

  void _setHover(bool value) {
    if (!widget.interactive || value == _hovering) return;
    setState(() => _hovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovering ? -4 : 0, 0),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: palette.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovering ? palette.accent : palette.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

/// Fades and slides its child in the first time it scrolls into view.
///
/// Honors the platform "reduce motion" setting by showing content instantly.
class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offsetY = 28,
  });

  final Widget child;
  final Duration delay;
  final double offsetY;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late final Animation<double> _curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  ScrollPosition? _position;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
      _started = true;
      return;
    }
    _position?.removeListener(_check);
    _position = Scrollable.maybeOf(context)?.position;
    _position?.addListener(_check);
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_started || !mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return;
    final top = box.localToGlobal(Offset.zero).dy;
    if (top < MediaQuery.sizeOf(context).height * 0.92) {
      _started = true;
      _position?.removeListener(_check);
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_check);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (context, child) => Opacity(
        opacity: _curve.value,
        child: Transform.translate(
          offset: Offset(0, widget.offsetY * (1 - _curve.value)),
          child: child,
        ),
      ),
    );
  }
}

/// Section-level entrance animation.
class FadeIn extends StatelessWidget {
  const FadeIn({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Reveal(child: child);
}

/// Counts a stat like "100K+" up from zero when it appears.
class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter(this.value, {super.key, this.style});

  final String value;
  final TextStyle? style;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );
  late final RegExpMatch? _match =
      RegExp(r'^(\d+)(.*)$').firstMatch(widget.value);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context) || _match == null) {
      _controller.value = 1;
    } else if (!_controller.isAnimating && _controller.value == 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final match = _match;
    if (match == null) return GradientText(widget.value, style: widget.style);
    final target = int.parse(match.group(1)!);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = Curves.easeOutExpo.transform(_controller.value);
        return GradientText(
          '${(target * t).round()}${match.group(2)}',
          style: widget.style,
        );
      },
    );
  }
}

/// Infinite, gentle back-and-forth animation value (0..1). Stays at 0 when
/// the platform asks for reduced motion (and therefore in tests).
class LoopingValue extends StatefulWidget {
  const LoopingValue({
    super.key,
    required this.duration,
    required this.builder,
    this.child,
  });

  final Duration duration;
  final Widget Function(BuildContext context, double t, Widget? child) builder;
  final Widget? child;

  @override
  State<LoopingValue> createState() => _LoopingValueState();
}

class _LoopingValueState extends State<LoopingValue>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) => widget.builder(
        context,
        Curves.easeInOut.transform(_controller.value),
        child,
      ),
    );
  }
}

/// Gradient text whose colors slowly sweep across it.
class ShimmerGradientText extends StatelessWidget {
  const ShimmerGradientText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return LoopingValue(
      duration: const Duration(seconds: 4),
      child: Text(text, style: style),
      builder: (context, t, child) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment(-1 - t, 0),
          end: Alignment(1 + t, 0),
          colors: [palette.accent, palette.accentAlt, palette.accent],
          stops: [0, 0.5 + 0.3 * (t - 0.5), 1],
        ).createShader(Offset.zero & bounds.size),
        child: child,
      ),
    );
  }
}

/// Lays children out in an evenly sized responsive grid using [Wrap], so
/// cards keep their natural height (no fixed aspect ratios).
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.columnsForWidth,
    this.spanFor,
    this.spacing = 18,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int Function(double width) columnsForWidth;

  /// How many columns item [index] spans (defaults to 1).
  final int Function(int index)? spanFor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = columnsForWidth(width);
        final cell = (width - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < itemCount; i++)
              SizedBox(
                width: () {
                  final span = (spanFor?.call(i) ?? 1).clamp(1, columns);
                  return cell * span + spacing * (span - 1);
                }(),
                child: Reveal(
                  delay: Duration(milliseconds: 90 * (i % columns)),
                  child: itemBuilder(context, i),
                ),
              ),
          ],
        );
      },
    );
  }
}
