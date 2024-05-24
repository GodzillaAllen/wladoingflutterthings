import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/circle.dart';
import '../screens/claculator.dart';
import '../screens/anagram.dart';
import '../screens/coinchange.dart';
import '../screens/homescreen.dart';
import '../screens/leap.dart';
import '../screens/lsc.dart';
import '../screens/myhomepage.dart';
import '../screens/palindrome.dart';
import '../screens/prime.dart';
import '../screens/queue.dart';
import '../screens/temperature.dart';
import 'screens/mytodopage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "To Do ",
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/todo', page: () => TodoListScreen()),
        GetPage(name: '/anagram', page: () => const AnagramHomePage()),
        GetPage(
            name: '/circle',
            page: () => const CircleRelationshipCheckerHomePage()),
        GetPage(name: '/calculator', page: () => const CalculatorHomePage()),
        GetPage(name: '/coinchange', page: () => const CoinChangeHomePage()),
        GetPage(name: '/leap', page: () => const LeapYearHomePage()),
        GetPage(name: '/lcs', page: () => const LcsCheckerHomePage()),
        GetPage(
            name: '/palindrome', page: () => const PalindromeCheckerHomePage()),
        GetPage(name: '/prime', page: () => const PrimeRangeCheckerHomePage()),
        GetPage(name: '/queue', page: () => QueueByStackHomePage()),
        GetPage(name: '/myhomepage', page: () => const HomeScreen()),
        GetPage(
            name: '/temperature',
            page: () => const TemperatureConverterHomePage()),
      ],
    );
  }
}
