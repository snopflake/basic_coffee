import 'package:flutter/material.dart';

class FillAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color fillColor;

  const FillAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.fillColor = Colors.orange,
  });

  @override
  FillAnimationState createState() => FillAnimationState();
}

class FillAnimationState extends State<FillAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void startFill() {
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.fillColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: widget.child,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
