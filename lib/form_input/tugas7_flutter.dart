import 'package:belajar_flutter/form_input/menu_dua.dart';
import 'package:belajar_flutter/form_input/menu_empat.dart';
import 'package:belajar_flutter/form_input/menu_lima.dart';
import 'package:belajar_flutter/form_input/menu_satu.dart';
import 'package:belajar_flutter/form_input/menu_tiga.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  int _selectedIndex = 0;
  bool isDarkMode = false;

  final List<Widget> _screen = <Widget>[
    MenuSatu(),
    MenuDua(),
    MenuTiga(),
    MenuEmpat(),
    MenuLima(),
  ];

  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Halaman saat ini : $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Form Input", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff077A7D),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff077A7D)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 32, backgroundColor: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    "Endah Fitria Ningsih",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "endahfitri@gmail.com",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.check_box, color: Colors.black),
              title: Text(
                "Syarat & Ketentuan",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              onTap: () {
                _selectedScreen(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode, color: Colors.black),
              title: Text(
                "Mode Gelap",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              onTap: () {
                _selectedScreen(1);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.black),
              title: Text(
                "Pilih Kategori Produk",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              onTap: () {
                _selectedScreen(2);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              title: Text(
                "Pilih Tanggal Lahir",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              onTap: () {
                _selectedScreen(3);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.alarm,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              title: Text(
                "Atur Pengingat",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              onTap: () {
                _selectedScreen(4);
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(child: _screen.elementAt(_selectedIndex)),
    );
  }
}
