// lib/widgets/fill_animation.dart
import 'package:flutter/material.dart';

class FillAnimation extends StatefulWidget {
  final Widget child;            // isi card (icon + teks + tombol)
  final Color backgroundColor;   // warna abu-abu card
  final Color fillColor;         // warna fill
  final Duration duration;

  const FillAnimation({
    Key? key,
    required this.child,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.fillColor = Colors.orange,
    this.duration = const Duration(milliseconds: 600),
  }) : super(key: key);

  @override
  FillAnimationState createState() => FillAnimationState();
}

class FillAnimationState extends State<FillAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  /// Panggil dari luar via GlobalKey
  void startFill() {
    _ctrl.forward(from: 0.0);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // 1) background abu-abu
          Positioned.fill(child: Container(color: widget.backgroundColor)),

          // 2) fill warna oren
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _anim,
              builder: (ctx, _) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: _anim.value,
                    child: Container(color: widget.fillColor),
                  ),
                );
              },
            ),
          ),

          // 3) isi card (icon + teks + tombol)
          Positioned.fill(child: widget.child),
        ],
      ),
    );
  }
}
