// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_coffee/data/coffee_data.dart';
import 'package:basic_coffee/models/coffee.dart';
import 'package:basic_coffee/widgets/coffee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int userToken = 500;

  void _redeem(int price) {
    setState(() => userToken -= price);
  }

  @override
  Widget build(BuildContext context) {
    // pastikan di main.dart theme text pakai GoogleFonts.interTextTheme()
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola! Supernova',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Siap menjalani harimu?',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=47'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Banner 
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/banner.png',
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 24),

              // Token Card
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 32,
                      color: Colors.amber.shade200,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Your Account',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$userToken Tokens',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Coffee List
              Column(
                children: coffeeList
                    .map((coffee) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CoffeeCard(
                            coffee: coffee,
                            currentToken: userToken,
                            onRedeem: _redeem,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
