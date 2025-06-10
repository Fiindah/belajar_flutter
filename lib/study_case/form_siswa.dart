import 'package:belajar_flutter/study_case/database/db_helper.dart';
import 'package:belajar_flutter/study_case/edit_siswa_screen.dart';
import 'package:belajar_flutter/study_case/model/siswa_model.dart';
import 'package:flutter/material.dart';

class SiswaApp extends StatefulWidget {
  const SiswaApp({super.key});

  @override
  State<SiswaApp> createState() => _SiswaAppState();
}

class _SiswaAppState extends State<SiswaApp> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  List<Siswa> daftarSiswa = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DBHelper.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaController.text;
    final umur = int.tryParse(umurController.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DBHelper.insertSiswa(Siswa(nama: nama, umur: umur.toString()));
      namaController.clear();
      umurController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pendaftaran Siswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: umurController,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: simpanData, child: Text("Simpan")),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (context, index) {
                  final siswa = daftarSiswa[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${siswa.id}')),
                    title: Text('Nama: ${siswa.nama}'),
                    subtitle: Text('Umur: ${siswa.umur}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            // Tunggu hasil dari EditSiswaScreen
                            final hasil = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditSiswaScreen(siswa: siswa),
                              ),
                            );

                            // Kalau hasil == true, berarti data berhasil diupdate
                            if (hasil == true) {
                              await muatData(); // Muat ulang data dari database
                              setState(() {}); // Untuk perbarui tampilan UI
                            }
                          },
                        ),

                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   onPressed: () async {
                        //     await Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (_) => EditSiswaScreen(siswa: siswa),
                        //       ),
                        //     );
                        //   },
                        // ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            final konfirmasi = await showDialog<bool>(
                              context: context,
                              builder:
                                  (_) => AlertDialog(
                                    title: Text('Hapus Siswa'),
                                    content: Text(
                                      'Yakin ingin menghapus ${siswa.nama}?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.pop(context, false),
                                        child: Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () => Navigator.pop(context, true),
                                        child: Text('Hapus'),
                                      ),
                                    ],
                                  ),
                            );
                            if (konfirmasi == true) {
                              await DBHelper.deleteSiswa(siswa.id!);
                              await muatData();
                            }
                          },

                          // onPressed: () async {
                          //   await DBHelperSiswa.deleteSiswa(siswa.id!);
                          //   await muatData(); // ini sudah memanggil setState
                          //   // setState(() {});
                          // },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
