import 'package:basic_coffee/data/coffee_data.dart';
import 'package:basic_coffee/models/coffee.dart';
import 'package:basic_coffee/widgets/coffee_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int userToken = 500; // Token awal pengguna

  void _redeem(int price) {
    setState(() {
      userToken -= price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Redeem'),
        backgroundColor: Colors.brown[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Token Display
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Token Kamu:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text('$userToken Token'),
                  backgroundColor: Colors.brown[200],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List Kopi
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  final Coffee coffee = coffeeList[index];
                  return CoffeeCard(
                    coffee: coffee,
                    currentToken: userToken,
                    onRedeem: _redeem,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
