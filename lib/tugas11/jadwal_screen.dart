import 'package:belajar_flutter/tugas11/database/db_helper.dart';
import 'package:belajar_flutter/tugas11/model/model_jadwal.dart';
import 'package:flutter/material.dart';

class JadwalApp extends StatefulWidget {
  const JadwalApp({super.key});

  @override
  State<JadwalApp> createState() => _JadwalAppState();
}

class _JadwalAppState extends State<JadwalApp> {
  final TextEditingController asalController = TextEditingController();
  final TextEditingController tujuanController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jamController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<ModelJadwal> jadwalTerbang = [];

  @override
  void initState() {
    super.initState();
    memuatData();
  }

  Future<void> memuatData() async {
    final data = await DBHelperDaftar.getAllDaftar();
    setState(() {
      jadwalTerbang = data;
    });
  }

  Future<void> menyimpanData() async {
    final asal = asalController.text;
    final tujuan = tujuanController.text;
    final tanggal = tanggalController.text;
    final jam = jamController.text;

    if (asal.isNotEmpty &&
        tujuan.isNotEmpty &&
        tanggal.isNotEmpty &&
        jam.isNotEmpty) {
      await DBHelperDaftar.insertJadwal(
        ModelJadwal(asal: asal, tujuan: tujuan, tanggal: tanggal, jam: jam),
      );
      asalController.clear();
      tujuanController.clear();
      tanggalController.clear();
      jamController.clear();
    }
    memuatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Muhajir Travel"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib diisi';
                  }
                  return null;
                },
                controller: asalController,
                decoration: InputDecoration(labelText: 'Asal Kota'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib diisi';
                  }
                  return null;
                },
                controller: tujuanController,
                decoration: InputDecoration(labelText: 'Kota Tujuan'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib diisi';
                  }
                  return null;
                },
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal Keberangkatan'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib diisi';
                  }
                  return null;
                },
                controller: jamController,
                decoration: InputDecoration(labelText: 'Waktu Keberangkatan'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    menyimpanData();
                  }
                },
                child: Text("Simpan"),
              ),
              Divider(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: jadwalTerbang.length,
                  itemBuilder: (context, index) {
                    final jadwal = jadwalTerbang[index];
                    return ListTile(
                      leading: Icon(Icons.flight),
                      title: Row(
                        children: [
                          Text(jadwal.asal),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 20),
                          SizedBox(width: 8),
                          Text(jadwal.tujuan),
                        ],
                      ),
                      subtitle: Text('${jadwal.tanggal} | ${jadwal.jam}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
