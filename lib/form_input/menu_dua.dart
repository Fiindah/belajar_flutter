import 'package:flutter/material.dart';

class MenuDua extends StatefulWidget {
  const MenuDua({super.key});

  @override
  State<MenuDua> createState() => _MenuDuaState();
}

class _MenuDuaState extends State<MenuDua> {
  // Switch untuk mode gelap
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: isDarkMode ? Color(0xff1E1E1E) : Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28),
            const Text(
              "Mode Gelap",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Aktifkan Mode Gelap", style: TextStyle(fontSize: 16)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: 20),
                  Text(
                    isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
