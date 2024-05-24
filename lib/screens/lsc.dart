import 'dart:math';

import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class LcsCheckerHomePage extends StatefulWidget {
  const LcsCheckerHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LcsCheckerHomePageState createState() => _LcsCheckerHomePageState();
}

class _LcsCheckerHomePageState extends State<LcsCheckerHomePage> {
  final TextEditingController _string1Controller = TextEditingController();
  final TextEditingController _string2Controller = TextEditingController();
  String _result = '';

  int _lcsLength(String s1, String s2) {
    int m = s1.length;
    int n = s2.length;
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
        } else {
          dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
        }
      }
    }

    return dp[m][n];
  }

  void _calculateLcs() {
    setState(() {
      String string1 = _string1Controller.text;
      String string2 = _string2Controller.text;
      int lcsLength = _lcsLength(string1, string2);
      _result = 'The length of the Longest Common Subsequence is: $lcsLength';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LCS Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _string1Controller,
              label: 'Enter first string',
              type: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _string2Controller,
              label: 'Enter second string',
              type: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLcs,
              child: const Text('Calculate LCS Length'),
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
