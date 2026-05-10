import 'dart:async';
import 'package:flutter/material.dart';
import 'result_page.dart';

class TimerPage extends StatefulWidget {
  final String nama;
  final int durasi;

  const TimerPage({super.key, required this.nama, required this.durasi});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late int waktu;
  late int totalWaktu;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    waktu = widget.durasi;
    totalWaktu = widget.durasi;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (waktu > 0) {
        setState(() {
          waktu--;
        });
      } else {
        t.cancel();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ResultPage(nama: widget.nama)),
        );
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nama)),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer, size: 100, color: Colors.orange),

            const SizedBox(height: 20),

            Text(
              widget.nama,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),

              child: LinearProgressIndicator(
                value: waktu / totalWaktu,
                minHeight: 15,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),

            Text(
              "$waktu",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
