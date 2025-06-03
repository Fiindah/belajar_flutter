import 'package:belajar_flutter/constant/app_color.dart';
import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key, required this.nama, required this.kota});
  final String nama;
  final String kota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terima kasih", style: TextStyle(color: AppColor.tael1)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Terima kasih $nama dari $kota sudah terdaftar.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.tael1,
                ),
                // AppStyle.fontBold(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
