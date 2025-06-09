import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Say Hello',
      home: Scaffold(
        appBar: AppBar(title: const Text('Say Hello')),
        body: const Center(
          child: Text('Hello!', style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}
