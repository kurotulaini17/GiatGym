import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  final String nama;
  const TimerPage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: Center(
        child: Text("Halaman $nama", style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
