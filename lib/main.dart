import 'package:flutter/material.dart';
import 'timer_page.dart';

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

  Widget tombol(BuildContext context, String nama) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TimerPage(
                nama: nama,
                durasi: nama == "Plank"
                    ? 30
                    : nama == "Squat"
                    ? 45
                    : 60,
              ),
            ),
          );
        },
        child: Text(nama),
      ),
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
          tombol(context, "Plank"),
          tombol(context, "Squat"),
          tombol(context, "Jumping Jack"),
        ],
      ),
    );
  }
}
