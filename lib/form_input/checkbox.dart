import 'package:flutter/material.dart';

class WidgetCheckBox extends StatefulWidget {
  const WidgetCheckBox({super.key});

  @override
  State<WidgetCheckBox> createState() => _WidgetCheckBoxState();
}

class _WidgetCheckBoxState extends State<WidgetCheckBox> {
  //Checkbox
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
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
                child: Text("Saya menyetujui semua persyaratan yang berlaku"),
              ),
            ],
          ),
          SizedBox(height: 8),
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
    );
  }
}
