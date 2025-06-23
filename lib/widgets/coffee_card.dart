import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final bool affordable;
  final VoidCallback onTap;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.affordable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: affordable ? Colors.orange[300] : Colors.grey[200],
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
                  coffee.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text('${coffee.price} Tokens'),
          ],
        ),
      ),
    );
  }
}