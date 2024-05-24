import 'dart:math';

import 'package:flutter/material.dart';

import '../widget/custom_text_field.dart';

class CircleRelationshipCheckerHomePage extends StatefulWidget {
  const CircleRelationshipCheckerHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CircleRelationshipCheckerHomePageState createState() =>
      _CircleRelationshipCheckerHomePageState();
}

class _CircleRelationshipCheckerHomePageState
    extends State<CircleRelationshipCheckerHomePage> {
  final TextEditingController _x1Controller = TextEditingController();
  final TextEditingController _y1Controller = TextEditingController();
  final TextEditingController _r1Controller = TextEditingController();
  final TextEditingController _x2Controller = TextEditingController();
  final TextEditingController _y2Controller = TextEditingController();
  final TextEditingController _r2Controller = TextEditingController();

  String _result = '';

  double _calculateDistance(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
  }

  void _checkCircleRelationship() {
    setState(() {
      double x1 = double.tryParse(_x1Controller.text) ?? 0.0;
      double y1 = double.tryParse(_y1Controller.text) ?? 0.0;
      double r1 = double.tryParse(_r1Controller.text) ?? 0.0;
      double x2 = double.tryParse(_x2Controller.text) ?? 0.0;
      double y2 = double.tryParse(_y2Controller.text) ?? 0.0;
      double r2 = double.tryParse(_r2Controller.text) ?? 0.0;

      double distance = _calculateDistance(x1, y1, x2, y2);

      if (distance <= (r1 - r2).abs()) {
        _result = 'Circle B is inside Circle A';
      } else if (distance <= (r2 - r1).abs()) {
        _result = 'Circle A is inside Circle B';
      } else if (distance < r1 + r2) {
        _result = 'Circle A and B intersect each other';
      } else if (distance == r1 + r2) {
        _result = 'Circle A and B are touching each other';
      } else {
        _result = 'Circle A and B do not overlap';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Relationship Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: 'Circle A: x1',
              controller: _x1Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Circle A: y1',
              controller: _y1Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Circle A: radius (r1)',
              controller: _r1Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Circle B: x2',
              controller: _x2Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Circle B: y2',
              controller: _y2Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Circle B: radius (r2)',
              controller: _r2Controller,
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkCircleRelationship,
              child: const Text('Check Relationship'),
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
