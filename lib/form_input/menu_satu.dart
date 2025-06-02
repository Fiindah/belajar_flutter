import 'package:flutter/material.dart';

class MenuSatu extends StatefulWidget {
  const MenuSatu({super.key});
  static String id = "tugas7_flutter";

  @override
  State<MenuSatu> createState() => _MenuSatuState();
}

class _MenuSatuState extends State<MenuSatu> {
  //Menampilkan Checkbox Syarat & Ketentuan
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            const Text(
              "Syarat & Ketentuan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Saya menyetujui semua persyaratan yang berlaku.",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              isChecked
                  ? 'Lanjutkan pendaftaran diperbolehkan'
                  : 'Anda belum bisa melanjutkan',
              style: TextStyle(
                fontSize: 16,
                color: isChecked ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
