import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class PalindromeCheckerHomePage extends StatefulWidget {
  const PalindromeCheckerHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PalindromeCheckerHomePageState createState() =>
      _PalindromeCheckerHomePageState();
}

class _PalindromeCheckerHomePageState extends State<PalindromeCheckerHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool _isPalindrome(String input) {
    String cleanString = input.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
    return cleanString == cleanString.split('').reversed.join('');
  }

  void _checkPalindrome() {
    setState(() {
      if (_controller.text.isEmpty) {
        _result = 'Please enter a text.';
      } else {
        _result = _isPalindrome(_controller.text)
            ? 'It\'s a palindrome!'
            : 'It\'s not a palindrome.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindrome Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              label: 'Enter text',
              type: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPalindrome,
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
