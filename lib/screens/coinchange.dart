import 'dart:math';

import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class CoinChangeHomePage extends StatefulWidget {
  const CoinChangeHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoinChangeHomePageState createState() => _CoinChangeHomePageState();
}

class _CoinChangeHomePageState extends State<CoinChangeHomePage> {
  final TextEditingController _coinsController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _result = '';

  int _minCoins(List<int> coins, int amount) {
    List<int> dp = List.filled(amount + 1, amount + 1);
    dp[0] = 0;

    for (int coin in coins) {
      for (int i = coin; i <= amount; i++) {
        dp[i] = min(dp[i], dp[i - coin] + 1);
      }
    }

    return dp[amount] > amount ? -1 : dp[amount];
  }

  void _calculateMinCoins() {
    setState(() {
      String coinsInput = _coinsController.text;
      int amount = int.tryParse(_amountController.text) ?? 0;
      List<int> coins = coinsInput
          .split(',')
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .toList();

      if (coins.isEmpty || amount <= 0) {
        _result = 'Please enter valid coin denominations and amount.';
      } else {
        int minCoins = _minCoins(coins, amount);
        if (minCoins == -1) {
          _result =
              'No solution exists to make up the amount with the given coins.';
        } else {
          _result = 'Minimum number of coins needed: $minCoins';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Change Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _coinsController,
              type: TextInputType.text,
              label: 'Enter coin denominations (comma separated)',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _amountController,
              label: 'Enter amount',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateMinCoins,
              child: const Text('Calculate Minimum Coins'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
