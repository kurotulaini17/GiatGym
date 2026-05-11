import 'package:flutter/material.dart';
import 'timer_page.dart';
import 'splash_page.dart';

void main() {
  runApp(const GiatGymApp());
}

class GiatGymApp extends StatelessWidget {
  const GiatGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget tombol(BuildContext context, String nama, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15),

          child: Row(
            children: [
              Icon(icon, size: 50, color: Colors.orange),

              const SizedBox(width: 20),

              Expanded(
                child: Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Memulai latihan $nama 💪🏻"),
                      duration: const Duration(seconds: 1),
                    ),
                  );

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

                child: const Text(
                  "Mulai",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
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

        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.fitness_center, size: 100, color: Colors.orange),

              const SizedBox(height: 20),

              const Text(
                "GiatGym",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              const Text(
                "Aplikasi latihan sederhana di rumah",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),

              const Text(
                "Pilih Latihan",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              tombol(context, "Plank", Icons.fitness_center),
              tombol(context, "Squat", Icons.sports_gymnastics),
              tombol(context, "Jumping Jack", Icons.directions_run),
            ],
          ),
        ),
      ),
    );
  }
}
