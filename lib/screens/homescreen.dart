import 'package:flutter/material.dart';
import '../widget/button_nevigation.dart';
import '../widget/route_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RouteButton(
              route: '/calculator',
              btnName: 'Go to Calculator',
            ),
            RouteButton(
              route: '/temperature',
              btnName: 'Go to Temperature converter',
            ),
            RouteButton(
              route: '/leap',
              btnName: 'Go to Leap Year Calculator',
            ),
            RouteButton(
              route: '/anagram',
              btnName: 'Go to Anagram checker',
            ),
            RouteButton(
              route: '/palindrome',
              btnName: 'Go to Palindrome checker',
            ),
            RouteButton(
              route: '/prime',
              btnName: 'Go to Prime Number finder',
            ),
            RouteButton(
              route: '/circle',
              btnName: 'go to circle intersection',
            ),
            RouteButton(
              route: '/lcs',
              btnName: 'go to lcs ',
            ),
            RouteButton(
              route: '/coinchange',
              btnName: 'go to coinchange ',
            ),
            RouteButton(
              route: '/queue',
              btnName: 'go to queue by stack ',
            ),
          ],
        ),
      ),
    );
  }
}
