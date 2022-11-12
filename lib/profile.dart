import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  //const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}