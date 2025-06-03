import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas10/thanks_screen.dart';
import 'package:belajar_flutter/utils/button.dart';
import 'package:flutter/material.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomerHpController = TextEditingController();
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: AppColor.tael1,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  // border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama wajib diisi";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email wajib diisi";
                  } else if (!value.contains("@")) {
                    return "Email tidak valid";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _nomerHpController,
                decoration: InputDecoration(labelText: "Nomor HP"),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: "Kota Domisili"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota Domisili wajib diisi";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12),
              DefaultButton(
                text: "Daftar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Berhasil");
                    dialogSuccess(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Berhasil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama : ${_fullnameController.text}"),
              Text("Email : ${_emailController.text}"),
              Text("Nomor HP : ${_nomerHpController.text}"),
              Text("Kota : ${_cityController.text}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tutup"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ThanksPage(
                          nama: _fullnameController.text,
                          kota: _cityController.text,
                        ),
                  ),
                );
              },
              child: Text("Lanjut"),
            ),
          ],
        );
      },
    );
  }
}
