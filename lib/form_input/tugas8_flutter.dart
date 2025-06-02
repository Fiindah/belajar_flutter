import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/constant/app_style.dart';
import 'package:belajar_flutter/form_input/profil_page.dart';
import 'package:belajar_flutter/form_input/tugas7_flutter.dart';
import 'package:flutter/material.dart';

class TugasDelapan extends StatefulWidget {
  const TugasDelapan({super.key});

  @override
  State<TugasDelapan> createState() => _TugasDelapanState();
}

class _TugasDelapanState extends State<TugasDelapan> {
  final List<Widget> _setScreen = [ProfilApp(), FormInput()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: AppColor.gray88,
        unselectedLabelStyle: AppStyle.fontRegular(
          fontSize: 10,
        ).copyWith(color: AppColor.gray88),
        selectedLabelStyle: AppStyle.fontBold(
          fontSize: 10,
        ).copyWith(color: Colors.teal),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tugas 7"),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: _setScreen[_selectedIndex],
    );
  }
}
