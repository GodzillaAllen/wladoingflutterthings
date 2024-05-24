import 'package:flutter/material.dart';

import '../widget/button_nevigation.dart';
import '../widget/route_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("menu"),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(15.0),
              child: Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Icon(Icons.person),
                  Text("wla.6wla9@gmail.com")
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("wla.6wla9@gmail.com"),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => true,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Info"),
              onTap: () => true,
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RouteButton(btnName: 'Add', route: "/todo"),
            RouteButton(btnName: 'Quiz', route: "/myhomepage")
          ],
        ),
      ),
    );
  }
}
