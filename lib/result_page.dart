import 'package:flutter/material.dart';
import 'main.dart';

class ResultPage extends StatelessWidget {
  final String nama;

  const ResultPage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 120, color: Colors.white),

              const SizedBox(height: 30),

              const Text(
                "Latihan Selesai!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Kamu telah menyelesaikan latihan $nama 💪🏻",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },

                icon: const Icon(Icons.home),

                label: const Text("Kembali ke Home"),

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),

                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
