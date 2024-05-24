import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class PrimeRangeCheckerHomePage extends StatefulWidget {
  const PrimeRangeCheckerHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrimeRangeCheckerHomePageState createState() =>
      _PrimeRangeCheckerHomePageState();
}

class _PrimeRangeCheckerHomePageState extends State<PrimeRangeCheckerHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool _isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  List<int> _getPrimesInRange(int max) {
    List<int> primes = [];
    for (int i = 2; i <= max; i++) {
      if (_isPrime(i)) {
        primes.add(i);
      }
    }
    return primes;
  }

  void _checkPrimesInRange() {
    setState(() {
      if (_controller.text.isEmpty) {
        _result = 'Please enter a number.';
      } else {
        int? number = int.tryParse(_controller.text);
        if (number == null || number < 2) {
          _result = 'Please enter a valid integer greater than 1.';
        } else {
          List<int> primes = _getPrimesInRange(number);
          _result = primes.isEmpty
              ? 'No prime numbers found in the range.'
              : 'Prime numbers between 0 and $number: ${primes.join(', ')}';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prime Range Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              label: 'Enter a number',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPrimesInRange,
              child: const Text('Check'),
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
