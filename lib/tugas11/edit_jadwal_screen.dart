import 'package:belajar_flutter/tugas11/database/db_helper.dart';
import 'package:belajar_flutter/tugas11/model/model_jadwal.dart';
import 'package:flutter/material.dart';

class EditJadwalScreen extends StatefulWidget {
  final ModelJadwal jadwal;
  final VoidCallback onUpdate;
  const EditJadwalScreen({
    super.key,
    required this.jadwal,
    required this.onUpdate,
  });

  @override
  State<EditJadwalScreen> createState() => _EditJadwalScreenState();
}

class _EditJadwalScreenState extends State<EditJadwalScreen> {
  late TextEditingController _asalController;
  late TextEditingController _tujuanController;
  late TextEditingController _tanggalController;
  late TextEditingController _jamController;

  @override
  void initState() {
    super.initState();
    _asalController = TextEditingController(text: widget.jadwal.asal);
    _tujuanController = TextEditingController(text: widget.jadwal.tujuan);
    _tanggalController = TextEditingController(text: widget.jadwal.tanggal);
    _jamController = TextEditingController(text: widget.jadwal.jam);
  }

  void update() async {
    final updated = ModelJadwal(
      id: widget.jadwal.id,
      asal: _asalController.text,
      tujuan: _tujuanController.text,
      tanggal: _tanggalController.text,
      jam: _jamController.text,
    );
    print('Updating data: $updated'); // Debug print to check values
    await DBHelperDaftar.updateJadwal(updated);
    widget.onUpdate();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Jadwal"), centerTitle: true),
      body: Column(
        children: [
          TextField(
            controller: _asalController,
            decoration: InputDecoration(labelText: "Asal"),
          ),
          TextField(
            controller: _tujuanController,
            decoration: InputDecoration(labelText: "Tujuan"),
          ),
          TextField(
            controller: _tanggalController,
            decoration: InputDecoration(labelText: "Tanggal"),
            keyboardType: TextInputType.numberWithOptions(),
          ),
          TextField(
            controller: _jamController,
            decoration: InputDecoration(labelText: "Jam"),
            keyboardType: TextInputType.numberWithOptions(),
          ),
          ElevatedButton(onPressed: update, child: Text("Update")),
        ],
      ),
    );
  }
}
