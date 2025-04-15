import 'package:blockstructure/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        size: MediaQuery.of(context).size,
        titleText: 'Home Page',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("View Users"),
              onPressed: () => Navigator.pushNamed(context, '/users'),
            ),
            ElevatedButton(
              child: Text("View Posts"),
              onPressed: () => Navigator.pushNamed(context, '/posts'),
            ),
          ],
        ),
      ),
    );
  }
}
