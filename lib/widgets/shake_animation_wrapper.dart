// lib/widgets/shake_animation_wrapper.dart
import 'package:flutter/material.dart';

class ShakeAnimationWrapper extends StatefulWidget {
  final Widget child;
  const ShakeAnimationWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  ShakeAnimationWrapperState createState() => ShakeAnimationWrapperState();
}

class ShakeAnimationWrapperState extends State<ShakeAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _offsetAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.linear));
  }

  /// Panggil untuk shake
  void shake() {
    _ctrl.forward(from: 0.0);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnim,
      builder: (ctx, child) {
        return Transform.translate(
          offset: Offset(_offsetAnim.value, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
