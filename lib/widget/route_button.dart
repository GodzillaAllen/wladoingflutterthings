import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({super.key, required this.btnName, required this.route});
  final String btnName;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed(route),
      child: Text(btnName),
    );
  }
}
