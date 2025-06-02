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
