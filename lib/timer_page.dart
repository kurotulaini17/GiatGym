import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final String nama;

  const TimerPage({super.key, required this.nama});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int waktu = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (waktu > 0) {
        setState(() {
          waktu--;
        });
      } else {
        t.cancel();
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
      body: Center(
        child: Text(
          "$waktu",
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
