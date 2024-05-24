import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _expression = '';
  String _result = '0';

  void _buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _expression = '';
        _result = '0';
      } else if (text == 'Result') {
        try {
          Parser p = Parser();
          Expression exp =
              p.parse(_expression.replaceAll('×', '*').replaceAll('÷', '/'));
          ContextModel cm = ContextModel();
          _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          _result = '0';
        }
      } else {
        _expression += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 32, color: Colors.grey[700]),
                  ),
                  Text(
                    _result,
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildButtonRow(['7', '8', '9', '÷']),
          _buildButtonRow(['4', '5', '6', '×']),
          _buildButtonRow(['1', '2', '3', '-']),
          _buildButtonRow(['0', '.', 'C', '+']),
          _buildButtonRow(['Result']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((text) {
          return _buildButton(text);
        }).toList(),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: _getButtonColor(text),
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(text),
          onPressed: () => _buttonPressed(text),
        ),
      ),
    );
  }

  Color? _getButtonColor(String text) {
    if (text == 'C') {
      return Colors.redAccent;
    } else if (text == '=' ||
        text == '+' ||
        text == '-' ||
        text == '×' ||
        text == '÷') {
      return Colors.blueAccent;
    }
    return Colors.grey[800];
  }
}
