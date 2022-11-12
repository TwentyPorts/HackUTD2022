import 'package:flutter/material.dart';
import 'package:smol_biz/camera.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraScreen()),
              );
            },
        ),
      ),
    );
  }
}