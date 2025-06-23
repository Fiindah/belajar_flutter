import 'package:belajar_flutter/tugas15/pages/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    //ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nama Aplikasi'), centerTitle: false),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   decoration: const BoxDecoration(
            //     color: Colors.deepPurple,
            //     gradient: LinearGradient(
            //       colors: [Colors.deepPurple, Colors.purpleAccent],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: const [
            //       CircleAvatar(
            //         radius: 30,
            //         backgroundImage: NetworkImage(
            //           'https://via.placeholder.com/150',
            //         ), // Ganti dengan gambar profil Anda
            //       ),
            //       SizedBox(height: 10),
            //       Text(
            //         'Nama Pengguna',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(
            //         'email@example.com',
            //         style: TextStyle(color: Colors.white70, fontSize: 14),
            //       ),
            //     ],
            //   ),
            // ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.deepPurple),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                _onItemTapped(0); // Pindah ke Home
              },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.deepPurple),
              title: const Text('Pengaturan'),
              // onTap: () {
              //   Navigator.pop(context);
              //   _onItemTapped(3); // Pindah ke Settings
              // },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.deepPurple),
              title: const Text('Tentang Aplikasi'),
              // onTap: () {
              //   Navigator.pop(context);
              //   // Tambahkan navigasi ke halaman Tentang Aplikasi
              // },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Jelajahi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
