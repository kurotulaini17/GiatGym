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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
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
        child: Text(
          nama,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          "GiatGym 💪🏻",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
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
      ),
    );
  }
}
