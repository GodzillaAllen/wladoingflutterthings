import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.blueAccent,
      onTap: (int index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home page"),
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          label: "E-mail",
        ),
      ],
    );
  }
}
