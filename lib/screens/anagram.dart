import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../widget/custom_text_field.dart';

class AnagramHomePage extends StatefulWidget {
  const AnagramHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnagramHomePageState createState() => _AnagramHomePageState();
}

class _AnagramHomePageState extends State<AnagramHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  bool areAnagrams(String str1, String str2) {
    if (str1.length != str2.length) {
      return false;
    }
    List<String> char1 = str1.split('')..sort();
    List<String> char2 = str2.split('')..sort();
    return const ListEquality().equals(char1, char2);
  }

  void _checkAnagram() {
    final String str1 = _controller1.text;
    final String str2 = _controller2.text;

    setState(() {
      if (areAnagrams(str1, str2)) {
        _result = '"$str1" and "$str2" are anagrams.';
      } else {
        _result = '"$str1" and "$str2" are not anagrams.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anagram Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: _controller1,
              type: TextInputType.text,
              label: "Enter The First String",
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              type: TextInputType.text,
              controller: _controller2,
              label: 'Enter the Second string',
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkAnagram,
              child: const Text('Check'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
