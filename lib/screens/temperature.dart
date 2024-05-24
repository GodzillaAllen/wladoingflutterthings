import 'package:flutter/material.dart';
import '../widget/custom_text_field.dart';

class TemperatureConverterHomePage extends StatefulWidget {
  const TemperatureConverterHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TemperatureConverterHomePageState createState() =>
      _TemperatureConverterHomePageState();
}

class _TemperatureConverterHomePageState
    extends State<TemperatureConverterHomePage> {
  final TextEditingController _controller = TextEditingController();

  String _toUnit = 'Fahrenheit';
  String _result = '';

  void _convert() {
    double value = double.tryParse(_controller.text) ?? 0;
    double result;

    switch (_toUnit) {
      case 'Celsius':
        result = (value - 32) * 5 / 9;
        break;
      case 'Fahrenheit':
        result = (value * 9 / 5) + 32;
        break;
      default:
        result = 0;
    }

    setState(() {
      _result = result.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _controller,
              type: TextInputType.number,
              label: 'Enter temperature',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _toUnit = newValue!;
                    });
                  },
                  items: <String>[
                    'Celsius',
                    'Fahrenheit',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
