import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class LeapYearHomePage extends StatefulWidget {
  const LeapYearHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeapYearHomePageState createState() => _LeapYearHomePageState();
}

class _LeapYearHomePageState extends State<LeapYearHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool isLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    } else {
      return true;
    }
  }

  void _checkLeapYear() {
    final int? year = int.tryParse(_controller.text);
    if (year == null) {
      setState(() {
        _result = 'Please enter a valid year.';
      });
      return;
    }

    setState(() {
      if (isLeapYear(year)) {
        _result = '$year is a leap year.';
      } else {
        _result = '$year is not a leap year.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leap Year Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: _controller,
              type: TextInputType.number,
              label: 'Enter a year',
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkLeapYear,
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
