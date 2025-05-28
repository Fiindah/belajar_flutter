import 'package:flutter/material.dart';

class PraktikSebelas extends StatelessWidget {
  const PraktikSebelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Praktik Navigator"), centerTitle: true),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => PraktikSebelasA()),
              (route) => false,
            );
          },
          child: Text(
            "Hallo Assalamu'alaikum",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ,
          ),
        ),
      ),
    );
  }
}

class PraktikSebelasA extends StatelessWidget {
  const PraktikSebelasA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hallo, Friend",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
