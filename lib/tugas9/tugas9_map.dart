import 'package:flutter/material.dart';

class KategoriAlat extends StatefulWidget {
  const KategoriAlat({super.key});

  @override
  State<KategoriAlat> createState() => _KategoriAlatState();
}

class _KategoriAlatState extends State<KategoriAlat> {
  // Map Widget
  List<Map<String, dynamic>> kategori = [
    {'alat': 'Panci', 'icon': Icons.kitchen},
    {'alat': 'Wajan', 'icon': Icons.kitchen},
    {'alat': 'Kompor', 'icon': Icons.kitchen},
    {'alat': 'Centong', 'icon': Icons.kitchen},
    {'alat': 'Piring', 'icon': Icons.kitchen},
    {'alat': 'Sendok', 'icon': Icons.kitchen},
    {'alat': 'Garpu', 'icon': Icons.kitchen},
    {'alat': 'Pisau', 'icon': Icons.kitchen},
    {'alat': 'Talenan', 'icon': Icons.kitchen},
    {'alat': 'Serbet', 'icon': Icons.kitchen},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kategoriUser = kategori.toList();
    return Scaffold(
      appBar: AppBar(title: Text("Peralatan Dapur")),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: kategoriUser.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(kategoriUser[index]['alat']),
            leading: Icon(kategoriUser[index]['icon']),
          );
        },
      ),
    );
  }
}
