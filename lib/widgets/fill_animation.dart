import 'package:flutter/material.dart';

/// SKELETON: peserta hanya perlu implementasi animasi fill-nya
class FillAnimation extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color fillColor;
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
  // TODO: deklarasikan AnimationController & Animation<double> di sini
  // late final AnimationController _ctrl;
  // late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    // TODO: inisialisasi _ctrl dan _anim
    // _ctrl = AnimationController(vsync: this, duration: widget.duration);
    // _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  /// Dipanggil dari luar (CoffeeCard) via GlobalKey
  void startFill() {
    // TODO: panggil _ctrl.forward(from: 0.0) untuk memulai animasi
    throw UnimplementedError('Implementasikan startFill()');
  }

  @override
  void dispose() {
    // TODO: dispose _ctrl
    // _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // 1) background card awal
          Positioned.fill(child: Container(color: widget.backgroundColor)),

          // 2) PESERTA: tambahkan overlay animasi fill di sini
          // contoh:
          // AnimatedBuilder(
          //   animation: _anim,
          //   builder: (_, __) => Align(
          //     alignment: Alignment.centerLeft,
          //     child: FractionallySizedBox(
          //       widthFactor: _anim.value,
          //       child: Container(color: widget.fillColor),
          //     ),
          //   ),
          // ),

          // 3) konten card (ikon + teks + tombol)
          Positioned.fill(child: widget.child),
        ],
      ),
    );
  }
}
