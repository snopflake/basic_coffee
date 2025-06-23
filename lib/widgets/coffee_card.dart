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
    Key? key,
    required this.coffee,
    required this.currentToken,
    required this.onRedeem,
  }) : super(key: key);

  @override
  _CoffeeCardState createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  final _shakeKey = GlobalKey<ShakeAnimationWrapperState>();
  final _fillKey = GlobalKey<FillAnimationState>();

  void _handleTap() {
    if (widget.currentToken >= widget.coffee.price) {
      _fillKey.currentState?.startFill();
      widget.onRedeem(widget.coffee.price);
      showCustomSnackbar(context, "Transaksi sukses, token mencukupi");
    } else {
      _shakeKey.currentState?.shake();
      showCustomSnackbar(
        context,
        "Transaksi gagal, token tidak mencukupi",
        success: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ShakeAnimationWrapper(
        key: _shakeKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: FillAnimation(
              key: _fillKey,
              backgroundColor: Colors.grey[300]!,
              fillColor: Colors.orange,
              duration: const Duration(milliseconds: 600),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.local_cafe, size: 40, color: Colors.indigo),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.coffee.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.coffee.price} Token',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
