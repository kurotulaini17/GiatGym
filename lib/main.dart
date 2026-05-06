import 'package:flutter/material.dart';

void main() {
  runApp(const GiatGymApp());
}

class GiatGymApp extends StatelessWidget {
  const GiatGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget tombol(String nama) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(onPressed: () {}, child: Text(nama)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GiatGym")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Pilih Latihan",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          tombol("Plank"),
          tombol("Squat"),
          tombol("Jumping Jack"),
        ],
      ),
    );
  }
}
