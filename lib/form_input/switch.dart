import 'package:belajar_flutter/constant/app_style.dart';
import 'package:flutter/material.dart';

class ModeGelap extends StatefulWidget {
  const ModeGelap({super.key});

  @override
  State<ModeGelap> createState() => _ModeGelapState();
}

class _ModeGelapState extends State<ModeGelap> {
  // Switch
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Text("Aktifkan Mode Gelap"),
          Row(
            children: [
              Switch(
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
              ),

              Text(
                isSwitchOn ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                style: AppStyle.fontBold(fontSize: isSwitchOn ? 25 : 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
