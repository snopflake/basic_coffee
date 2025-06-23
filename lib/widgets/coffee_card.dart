import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeCard extends StatefulWidget {
  final Coffee coffee;
  final bool affordable;
  final VoidCallback onSuccess;
  final VoidCallback onFail;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.affordable,
    required this.onSuccess,
    required this.onFail,
  });

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _shakeAnim;
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _shakeAnim = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.05, 0),
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_controller);
  }

  void _onTap() {
    if (widget.affordable) {
      setState(() => _isFilled = true);
      widget.onSuccess();
    } else {
      _controller.forward(from: 0);
      widget.onFail();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SlideTransition(
        position: _shakeAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isFilled ? Colors.orange : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.local_cafe, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    widget.coffee.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text('${widget.coffee.price} Tokens'),
            ],
          ),
        ),
      ),
    );
  }
}
