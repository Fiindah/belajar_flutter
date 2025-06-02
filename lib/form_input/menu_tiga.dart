import 'package:flutter/material.dart';

class MenuTiga extends StatefulWidget {
  const MenuTiga({super.key});

  @override
  State<MenuTiga> createState() => _MenuTigaState();
}

class _MenuTigaState extends State<MenuTiga> {
  // Menampikan Dropdown menu pilihan
  String? isSelected;

  final List<String> dropdownItem = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            const Text(
              "Pilih Kategori Produk",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: isSelected,
              hint: Text(
                "Pilih Kategori Produk",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              items:
                  dropdownItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
            SizedBox(height: 20),
            if (isSelected != null)
              Text(
                'Anda memilih kategori: $isSelected',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
