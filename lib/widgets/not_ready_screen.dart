import 'package:flutter/material.dart';

class NotReadyScreen extends StatelessWidget {
  final String title;
  const NotReadyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text("Page en cours de réalisation")),
    );
  }
}