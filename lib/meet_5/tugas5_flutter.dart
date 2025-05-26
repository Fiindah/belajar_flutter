import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  String nama = "Endah Fitria";
  String output = '';
  bool tampilkanNama = false;
  String isfavorite = '';
  bool tampilFavorite = false;
  bool tampilDeskrisi = false;
  int hitung = 0;
  bool tampilText = false;

  void tambahAngka() {
    setState(() {
      hitung += 1;
    });
  }

  void _handleTap() {
    print('Kotak disentuh');
    setState(() {
      tampilText = !tampilText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pengguna", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff4D55CC),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahAngka,
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          Center(child: Text('$hitung', style: TextStyle(fontSize: 40))),

          ElevatedButton(
            onPressed: () {
              setState(() {
                output = tampilkanNama ? 'Nama Saya: $nama' : "";
                tampilkanNama = !tampilkanNama;
              });
            },
            child: Text("Tampilkan Nama"),
          ),
          Text(output),

          SizedBox(height: 24),
          Container(
            child: IconButton(
              onPressed: () {
                setState(() {
                  tampilFavorite = !tampilFavorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: tampilFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                tampilDeskrisi = !tampilDeskrisi;
              });
            },
            child: Text(tampilDeskrisi ? 'Sembunyikan' : 'Lihat Selengkapnya'),
          ),
          if (tampilDeskrisi)
            Text(
              'Ini adalah deskripsi tambahan yang ditampilkan setelah tombol ditekan.',
              style: TextStyle(color: Colors.grey[700]),
            ),
          SizedBox(height: 24),
          Container(
            child: Column(
              children: [
                // InkWell
                InkWell(
                  onTap: _handleTap,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xff4D55CC),
                    child: Text(
                      'Tekan Saya',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (tampilText)
                  Text('Teks muncul!', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),

                // GestureDetector
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Ditekan sekali');
                    },
                    onDoubleTap: () {
                      print('Ditekan dua kali');
                    },
                    onLongPress: () {
                      print('Tahan lama');
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Color(0xff4D55CC),
                      child: Text(
                        'Tekan Aku',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
