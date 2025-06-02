import 'package:flutter/material.dart';

class AlatDapur extends StatefulWidget {
  const AlatDapur({super.key});

  @override
  State<AlatDapur> createState() => _AlatDapurState();
}

class _AlatDapurState extends State<AlatDapur> {
  // List Widget
  final List<String> peralatanDapur = [
    "Panci",
    "Wajan",
    "Kompor",
    "Centong",
    "Piring",
    "Sendok",
    "Garpu",
    "Pisau",
    "Talenan",
    "Serbet",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Peralatan Dapur")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: peralatanDapur.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    peralatanDapur[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

