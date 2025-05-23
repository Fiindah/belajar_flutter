import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7965C1),
        title: Text(
          "Formulir dan Data Produk",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "Data Pengguna",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff7965C1),
                fontFamily: 'RobotoMono',
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkkan Nama",
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff7965C1)),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkkan Email",
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff7965C1)),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkkan Nomor HP",
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff7965C1)),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Tuliskan deskripsi di sini. . .",
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff7965C1)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Data Produk",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff7965C1),
                fontFamily: 'RobotoMono',
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Image.asset(
                "assets/images/nasi goreng.jpg",
                height: 200,
                width: 150,
              ),
              title: Text("Nasi Goreng Special"),
              subtitle: Text("RP 30.300"),
            ),

            ListTile(
              leading: Image.asset(
                "assets/images/nasi kuning.jpg",
                height: 200,
                width: 150,
              ),
              title: Text("Nasi Kuning Special"),
              subtitle: Text("RP 28.300"),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/nasi padang.jpeg",
                height: 200,
                width: 150,
              ),
              title: Text("Nasi Padang Special"),
              subtitle: Text("RP 29.300"),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/nasi tumpeng.jpg",
                height: 200,
                width: 150,
              ),
              title: Text("Nasi Tumpeng Special"),
              subtitle: Text("RP 29.300"),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/nasi uduk.jpg",
                height: 200,
                width: 150,
              ),
              title: Text("Nasi Uduk Special"),
              subtitle: Text("RP 29.300"),
            ),
          ],
        ),
      ),
    );
  }
}
