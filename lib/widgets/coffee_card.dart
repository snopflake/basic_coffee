import 'package:basic_coffee/models/coffee.dart';
import 'package:basic_coffee/widgets/custom_snackbar.dart';
import 'package:basic_coffee/widgets/fill_animation.dart';
import 'package:basic_coffee/widgets/shake_animation_wrapper.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatefulWidget {
  final Coffee coffee;
  final int currentToken;
  final Function(int) onRedeem;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.currentToken,
    required this.onRedeem,
  });

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  final GlobalKey<ShakeAnimationWrapperState> _shakeKey = GlobalKey();
  final GlobalKey<FillAnimationState> _fillKey = GlobalKey();

  void _handleTap() {
    final price = widget.coffee.price;

    if (widget.currentToken >= price) {
      // Trigger animasi fill lewat GlobalKey
      _fillKey.currentState?.startFill();

      // Callback untuk mengurangi token
      widget.onRedeem(price);

      // Tampilkan snackbar sukses
      showCustomSnackbar(context, "Transaksi sukses, token mencukupi");
    } else {
      // Trigger animasi shake via GlobalKey
      _shakeKey.currentState?.shake();

      // Tampilkan snackbar gagal
      showCustomSnackbar(context, "Transaksi gagal, token tidak mencukupi", success: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ShakeAnimationWrapper(
        key: _shakeKey,
        child: Stack(
          children: [
            //Fill animation wraps entire card
            FillAnimation(
              key: _fillKey,
              child: Container(
                height: 120,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.local_cafe, size: 40, color: Colors.brown),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.coffee.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('${widget.coffee.price} Token',
                            style: const TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}