import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

enum ButtonAnimation { none, bounce, particles }

class _Particle {
  final double angle;
  final double speed;
  final double size;
  final Color color;

  const _Particle({
    required this.angle,
    required this.speed,
    required this.size,
    required this.color,
  });
}

class _ParticlePainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;

  _ParticlePainter({required this.progress, required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0 || particles.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);
    final t = Curves.easeOut.transform(progress);

    for (final p in particles) {
      final distance = p.speed * t;
      final pos = center + Offset(
        math.cos(p.angle) * distance,
        math.sin(p.angle) * distance,
      );
      final opacity = (1 - t).clamp(0.0, 1.0);
      final radius = (p.size * (1 - progress * 0.4)).clamp(0.5, p.size);

      canvas.drawCircle(
        pos,
        radius,
        Paint()..color = p.color.withValues(alpha: opacity),
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
}

class FeedActionButton extends StatefulWidget {
  final PhosphorIconData icon;
  final Color color;
  final VoidCallback onTap;
  final ButtonAnimation animation;
  final List<Color>? particleColors;

  const FeedActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
    this.animation = ButtonAnimation.bounce,
    this.particleColors,
  });

  @override
  State<FeedActionButton> createState() => _FeedActionButtonState();
}

class _FeedActionButtonState extends State<FeedActionButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  List<_Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: switch (widget.animation) {
        ButtonAnimation.bounce    => const Duration(milliseconds: 130),
        ButtonAnimation.particles => const Duration(milliseconds: 650),
        ButtonAnimation.none      => Duration.zero,
      },
    );

    _scale = switch (widget.animation) {
      ButtonAnimation.bounce => Tween<double>(begin: 1.0, end: 0.6).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
      ButtonAnimation.particles => TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.35), weight: 15),
          TweenSequenceItem(tween: Tween(begin: 1.35, end: 1.0), weight: 85),
        ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
      ButtonAnimation.none => const AlwaysStoppedAnimation(1.0),
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<_Particle> _generateParticles() {
    final rng = math.Random();
    final colors = widget.particleColors ?? [widget.color];
    return List.generate(12, (i) {
      final baseAngle = (i / 12) * 2 * math.pi;
      return _Particle(
        angle: baseAngle + rng.nextDouble() * 0.5 - 0.25,
        speed: 22 + rng.nextDouble() * 22,
        size:  2.5 + rng.nextDouble() * 3.0,
        color: colors[rng.nextInt(colors.length)],
      );
    });
  }

  Future<void> _onTap() async {
    switch (widget.animation) {
      case ButtonAnimation.none:
        widget.onTap();
      case ButtonAnimation.bounce:
        await _controller.forward(from: 0);
        await _controller.reverse();
        widget.onTap();
      case ButtonAnimation.particles:
        setState(() => _particles = _generateParticles());
        widget.onTap();
        _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasParticles = widget.animation == ButtonAnimation.particles;

    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: OverflowBox(
          maxWidth: hasParticles ? 80 : 30,
          maxHeight: hasParticles ? 80 : 30,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (hasParticles)
                IgnorePointer(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) => CustomPaint(
                      size: const Size(80, 80),
                      painter: _ParticlePainter(
                        progress: _controller.value,
                        particles: _particles,
                      ),
                    ),
                  ),
                ),
              ScaleTransition(
                scale: _scale,
                child: PhosphorIcon(
                  widget.icon,
                  color: widget.color,
                  size: AppSizes.iconMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
