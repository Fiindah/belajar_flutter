import 'package:belajar_flutter/study_case/database/db_helper.dart';
import 'package:belajar_flutter/study_case/model/siswa_model.dart';
import 'package:flutter/material.dart';

class EditSiswaScreen extends StatefulWidget {
  final Siswa siswa;
  const EditSiswaScreen({super.key, required this.siswa});

  @override
  State<EditSiswaScreen> createState() => _EditSiswaScreenState();
}

class _EditSiswaScreenState extends State<EditSiswaScreen> {
  late TextEditingController _namaController;
  late TextEditingController _umurController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.siswa.nama);
    _umurController = TextEditingController(text: widget.siswa.umur);
  }

  void update() async {
    final updated = Siswa(
      id: widget.siswa.id,
      nama: _namaController.text,
      umur: _umurController.text,
    );
    await DBHelper.updateSiswa(updated);
    Navigator.pop(context, true); // <--- kirim sinyal "jika berhasil"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Siswa'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _umurController,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(onPressed: update, child: Text('Update')),
          ],
        ),
      ),
    );
  }
}
