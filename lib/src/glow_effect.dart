/// A highly customizable animated glow effect for Flutter widgets.
///
/// The [GlowEffect] widget paints animated glow layers behind its [child]
/// using a variety of shapes such as circles, rectangles, stars,
/// polygons, decorative shapes, and more.
///
/// This implementation is lightweight and leverages a [CustomPainter]
/// with animation support for smooth and efficient rendering.
library;

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Defines the shape used to render the glow effect.
///
/// Different shape types allow you to create custom visual styles,
/// including circular glows, polygon-based glows, stars,
/// decorative badges, and modern UI shapes.
enum GlowShapeType {
  rectangle,
  roundedRect,
  circle,
  stadium,
  heart,

  // Basic Shapes
  square,
  oval,
  ellipse,
  capsule,
  pill,

  // Polygon Shapes
  triangle,
  diamond,
  pentagon,
  hexagon,
  octagon,

  // Star Shapes
  star,
  starFive,
  starSix,

  // Decorative Shapes
  cloud,
  bubble,
  badge,
  shield,

  // UI/Modern Shapes
  cutCorner,
  beveledRect,
  ticket,
  ribbon,
}

/// A widget that adds an animated glowing effect around its [child].
///
/// The glow expands and fades over time based on animation progress.
/// You can customize the glow's color, shape, duration, curve,
/// repetition behavior, and expansion radius.
///
/// Example:
/// ```dart
/// GlowEffect(
///   glowColor: Colors.blue,
///   glowShape: GlowShapeType.circle,
///   child: Icon(Icons.favorite),
/// )
/// ```
class GlowEffect extends StatefulWidget {
  /// Creates a [GlowEffect].
  ///
  /// The [child] widget is required.
  ///
  /// If [glowShape] is set to [GlowShapeType.circle],
  /// [glowBorderRadius] must be null.
  const GlowEffect({
    super.key,
    required this.child,
    this.glowCount = 2,
    this.glowColor = Colors.white,
    this.glowShape = GlowShapeType.rectangle,
    this.glowBorderRadius,
    this.duration = const Duration(seconds: 2),
    this.startDelay,
    this.animate = true,
    this.repeat = true,
    this.curve = Curves.fastOutSlowIn,
    this.glowRadiusFactor = 0.7,
    this.repeatPauseDuration,
    this.endGlowRadius,
  }) : assert(
          !(glowShape == GlowShapeType.circle && glowBorderRadius != null),
          'GlowEffect: You cannot use circle shape with glowBorderRadius. '
          'Either remove glowBorderRadius or use a rounded/rectangle shape.',
        );

  /// The widget that the glow effect will be painted around.
  final Widget child;

  /// Number of glow layers rendered around the child.
  ///
  /// Higher values create a softer and more diffused glow.
  final int glowCount;

  /// The color of the glow effect.
  final Color glowColor;

  /// Shape used for rendering the glow.
  final GlowShapeType glowShape;

  /// Optional border radius used when the glow shape supports rounded corners.
  ///
  /// Must be null when using [GlowShapeType.circle].
  final BorderRadius? glowBorderRadius;

  /// Duration of a single glow animation cycle.
  final Duration duration;

  /// Optional delay before the animation starts.
  final Duration? startDelay;

  /// Whether the glow animation should run.
  ///
  /// If false, the glow remains static.
  final bool animate;

  /// Whether the glow animation should repeat after completing.
  final bool repeat;

  /// Animation curve used for glow expansion.
  final Curve curve;

  /// Controls how far the glow expands relative to its base radius.
  ///
  /// Higher values result in a larger glow spread.
  final double glowRadiusFactor;

  /// Optional pause duration between repeated animations.
  final Duration? repeatPauseDuration;

  /// Optional explicit maximum radius for the glow expansion.
  ///
  /// If null, the radius is calculated using [glowRadiusFactor].
  final double? endGlowRadius;

  @override
  State<GlowEffect> createState() => _GlowEffectState();
}

class _GlowEffectState extends State<GlowEffect>
    with SingleTickerProviderStateMixin<GlowEffect> {
  late final AnimationController _controller;
  late final _GlowPainter _painter;
  late final Tween<double> _opacityTween = Tween<double>(begin: 0.3, end: 0);

  void _startAnimation() async {
    if (widget.startDelay != null) {
      await Future.delayed(widget.startDelay!);
    }
    if (!mounted) return;

    if (widget.repeat) {
      _controller.addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          if (widget.repeatPauseDuration != null) {
            await Future.delayed(widget.repeatPauseDuration!);
          }
          if (mounted && widget.animate) {
            _controller.forward(from: 0);
          }
        }
      });
      _controller.forward();
    } else {
      _controller.forward();
    }
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _painter = _GlowPainter(progress: _controller);

    if (widget.animate) {
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant GlowEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }

    if (widget.animate != oldWidget.animate) {
      widget.animate ? _startAnimation() : _stopAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _painter
          ..shapeType = widget.glowShape
          ..glowBorderRadius = widget.glowBorderRadius
          ..glowColor = widget.glowColor
          ..curve = widget.curve
          ..opacityTween = _opacityTween
          ..glowCount = widget.glowCount
          ..glowRadiusFactor = widget.glowRadiusFactor
          ..endGlowRadius = widget.endGlowRadius,
        child: widget.child,
      ),
    );
  }
}

class _GlowPainter extends ChangeNotifier implements CustomPainter {
  _GlowPainter({required this.progress}) {
    progress.addListener(notifyListeners);
  }

  final Animation<double> progress;

  GlowShapeType _shapeType = GlowShapeType.rectangle;
  BorderRadius? _glowBorderRadius;
  Color _glowColor = Colors.white;
  Curve _curve = Curves.linear;
  Tween<double> _opacityTween = Tween<double>(begin: 0.3, end: 0);
  int _glowCount = 2;
  double _glowRadiusFactor = 0.7;
  double? _endGlowRadius;

  set shapeType(GlowShapeType v) {
    if (_shapeType != v) {
      _shapeType = v;
      notifyListeners();
    }
  }

  set glowBorderRadius(BorderRadius? v) {
    if (_glowBorderRadius != v) {
      _glowBorderRadius = v;
      notifyListeners();
    }
  }

  set glowColor(Color v) {
    if (_glowColor != v) {
      _glowColor = v;
      notifyListeners();
    }
  }

  set curve(Curve v) {
    if (_curve != v) {
      _curve = v;
      notifyListeners();
    }
  }

  set opacityTween(Tween<double> v) {
    if (_opacityTween != v) {
      _opacityTween = v;
      notifyListeners();
    }
  }

  set glowCount(int v) {
    if (_glowCount != v) {
      _glowCount = v;
      notifyListeners();
    }
  }

  set glowRadiusFactor(double v) {
    if (_glowRadiusFactor != v) {
      _glowRadiusFactor = v;
      notifyListeners();
    }
  }

  set endGlowRadius(double? v) {
    if (_endGlowRadius != v) {
      _endGlowRadius = v;
      notifyListeners();
    }
  }

  final Path _glowPath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    final baseOpacity = _opacityTween.evaluate(progress);
    final t = _curve.transform(progress.value);

    final baseRadius = math.min(size.width, size.height) / 2;

    // How far each layer is spaced from the previous one
    final layerSpacing =
        (_endGlowRadius ?? (baseRadius * (1 + _glowRadiusFactor))) - baseRadius;

    for (int i = 0; i < _glowCount; i++) {
      // Each layer sits further out
      final layerIndex = i + 1;

      final layerBaseRadius =
          baseRadius + (layerSpacing / _glowCount) * layerIndex;

      // Animate expansion
      final currentRadius = baseRadius + (layerBaseRadius - baseRadius) * t;

      // Fade outer layers more
      final layerOpacity =
          baseOpacity * (1.0 - (layerIndex / (_glowCount + 1)));

      final paint = Paint()
        ..color = _glowColor.withValues(alpha: layerOpacity.clamp(0.0, 1.0))
        ..style = PaintingStyle.fill;

      final rect = Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: currentRadius,
      );

      _glowPath.reset();
      _addGlowPath(rect);

      canvas.drawPath(_glowPath, paint);
    }
  }

  void _addGlowPath(Rect rect) {
    switch (_shapeType) {
      case GlowShapeType.circle:
      case GlowShapeType.oval:
      case GlowShapeType.ellipse:
        _glowPath.addOval(rect);
        break;

      case GlowShapeType.square:
      case GlowShapeType.rectangle:
        _glowPath.addRect(rect);
        break;

      case GlowShapeType.roundedRect:
      case GlowShapeType.badge:
      case GlowShapeType.bubble:
      case GlowShapeType.ticket:
      case GlowShapeType.cutCorner:
      case GlowShapeType.beveledRect:
      case GlowShapeType.pill:
      case GlowShapeType.capsule:
        final br = _glowBorderRadius ?? BorderRadius.circular(rect.height / 4);
        _glowPath.addRRect(RRect.fromRectAndCorners(
          rect,
          topLeft: br.topLeft,
          topRight: br.topRight,
          bottomLeft: br.bottomLeft,
          bottomRight: br.bottomRight,
        ));
        break;

      case GlowShapeType.stadium:
        _glowPath.addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)),
        );
        break;

      case GlowShapeType.heart:
        _glowPath.addPath(_createHeartPath(rect), Offset.zero);
        break;

      case GlowShapeType.triangle:
        _glowPath.addPath(
            _regularPolygon(rect, 3, rotation: -math.pi / 2), Offset.zero);
        break;

      case GlowShapeType.diamond:
        _glowPath.addPath(
            _regularPolygon(rect, 4, rotation: math.pi / 4), Offset.zero);
        break;

      case GlowShapeType.pentagon:
        _glowPath.addPath(_regularPolygon(rect, 5), Offset.zero);
        break;

      case GlowShapeType.hexagon:
        _glowPath.addPath(_regularPolygon(rect, 6), Offset.zero);
        break;

      case GlowShapeType.octagon:
        _glowPath.addPath(_regularPolygon(rect, 8), Offset.zero);
        break;

      case GlowShapeType.star:
      case GlowShapeType.starFive:
        _glowPath.addPath(_star(rect, 5), Offset.zero);
        break;

      case GlowShapeType.starSix:
        _glowPath.addPath(_star(rect, 6), Offset.zero);
        break;

      case GlowShapeType.cloud:
      case GlowShapeType.ribbon:
      case GlowShapeType.shield:
        _glowPath.addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.shortestSide / 3)),
        );
        break;
    }
  }

  Path _regularPolygon(Rect rect, int sides, {double rotation = 0}) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final r = rect.shortestSide / 2;

    for (int i = 0; i <= sides; i++) {
      final angle = rotation + (2 * math.pi * i / sides);
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  Path _star(Rect rect, int points) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final outerR = rect.shortestSide / 2;
    final innerR = outerR * 0.5;

    final total = points * 2;
    for (int i = 0; i <= total; i++) {
      final isOuter = i.isEven;
      final r = isOuter ? outerR : innerR;
      final angle = -math.pi / 2 + (math.pi * i / points);
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  Path _createHeartPath(Rect rect) {
    final path = Path();
    final w = rect.width;
    final h = rect.height;
    final cx = rect.center.dx;
    final cy = rect.center.dy;

    const steps = 200;
    const rawW = 32.0;
    const rawH = 26.0;

    final scaleX = w / rawW;
    final scaleY = h / rawH;

    bool first = true;
    for (int i = 0; i <= steps; i++) {
      final t = (i / steps) * 2 * math.pi;
      final x = 16 * math.pow(math.sin(t), 3).toDouble();
      final y = 13 * math.cos(t) -
          5 * math.cos(2 * t) -
          2 * math.cos(3 * t) -
          math.cos(4 * t);

      final px = cx + x * scaleX;
      final py = cy - y * scaleY;

      if (first) {
        path.moveTo(px, py);
        first = false;
      } else {
        path.lineTo(px, py);
      }
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    progress.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  @override
  bool? hitTest(Offset position) => null;
  @override
  SemanticsBuilderCallback? get semanticsBuilder => null;
  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
  @override
  String toString() => describeIdentity(this);
}
