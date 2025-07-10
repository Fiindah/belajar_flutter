// import 'package:flutter/material.dart';
// import 'package:myapp/detail_page.dart'; // Pastikan nama file ini sesuai
// import 'package:myapp/form_page.dart';
// import 'package:myapp/statistik_page.dart';
// import 'package:myapp/buttom_nav_bar.dart'; // Tambahkan import untuk halaman statistik

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Ganti dengan nama pengguna yang sedang login
//   final String _namaPengguna =
//       'Budi'; // Contoh: Anda bisa ambil dari sesi login
//   int _selectedIndex =
//       0; // Tambahkan variabel ini untuk melacak indeks tab yang aktif

//   // Data dummy untuk daftar laporan sampah
//   final List<Map<String, String>> _laporanSampah = [
//     {
//       'id': 'LPS001',
//       'lokasi': 'Jl. Merdeka No. 10, Jakarta Pusat',
//       'jenis_sampah': 'Organik & Anorganik',
//       'tanggal': '23 Juni 2025',
//       'status': 'Masuk', // Status: Masuk
//       'gambar_url':
//           'https://via.placeholder.com/150/FF6347/FFFFFF?text=Sampah+1',
//       'deskripsi': 'Tumpukan sampah rumah tangga di depan gerbang perumahan.',
//     },
//     {
//       'id': 'LPS002',
//       'lokasi': 'Perumahan Indah Blok C-5, Bekasi',
//       'jenis_sampah': 'Kertas',
//       'tanggal': '23 Juni 2025',
//       'status': 'Proses', // Status: Proses
//       'gambar_url':
//           'https://via.placeholder.com/150/4682B4/FFFFFF?text=Sampah+2',
//       'deskripsi':
//           'Banyak kardus bekas dan kertas koran menumpuk di sisi jalan.', // Deskripsi yang lebih spesifik
//     },
//     {
//       'id': 'LPS003',
//       'lokasi': 'Dekat Pasar Tradisional, Bandung',
//       'jenis_sampah': 'Plastik',
//       'tanggal': '22 Juni 2025',
//       'status': 'Selesai', // Status: Selesai
//       'gambar_url':
//           'https://via.placeholder.com/150/3CB371/FFFFFF?text=Sampah+3',
//       'deskripsi': 'Sampah plastik botol dan kemasan di sekitar area pasar.',
//     },
//     {
//       'id': 'LPS004',
//       'lokasi': 'Area Kantor, Surabaya',
//       'jenis_sampah': 'Elektronik',
//       'tanggal': '22 Juni 2025',
//       'status': 'Masuk', // Status: Masuk
//       'gambar_url':
//           'https://via.placeholder.com/150/FFD700/FFFFFF?text=Sampah+4',
//       'deskripsi':
//           'Limbah elektronik seperti kabel dan baterai bekas di samping gedung.',
//     },
//     {
//       'id': 'LPS005',
//       'lokasi': 'Jalan Pahlawan No. 5, Yogyakarta',
//       'jenis_sampah': 'Kaca',
//       'tanggal': '21 Juni 2025',
//       'status': 'Proses', // Status: Proses
//       'gambar_url':
//           'https://via.placeholder.com/150/8A2BE2/FFFFFF?text=Sampah+5',
//       'deskripsi': 'Pecahan kaca dari botol dan jendela yang pecah.',
//     },
//   ];

//   // List halaman yang akan diakses melalui BottomNavigationBar
//   late final List<Widget> _widgetOptions = <Widget>[
//     // Halaman Beranda
//     _buildHomePageContent(),
//     // Halaman Riwayat (Anda bisa menggantinya dengan widget riwayat yang sebenarnya nanti)
//     const Center(
//       child: Text(
//         'Halaman Riwayat Laporan',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     ),
//     // Halaman Statistik
//     StatistikPage(laporanData: _laporanSampah), // Meneruskan data laporan
//   ];

//   // Fungsi helper untuk mendapatkan warna berdasarkan status
//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'Masuk':
//         return Colors.blue[100]!; // Biru muda untuk status Masuk
//       case 'Proses':
//         return Colors.orange[100]!; // Oranye muda untuk status Proses
//       case 'Selesai':
//         return Colors.green[100]!; // Hijau muda untuk status Selesai
//       default:
//         return Colors.grey[100]!; // Warna default
//     }
//   }

//   // Fungsi helper untuk mendapatkan warna teks berdasarkan status
//   Color _getStatusTextColor(String status) {
//     switch (status) {
//       case 'Masuk':
//         return Colors.blue[700]!;
//       case 'Proses':
//         return Colors.orange[700]!;
//       case 'Selesai':
//         return Colors.green[700]!;
//       default:
//         return Colors.grey[700]!;
//     }
//   }

//   // Fungsi yang berisi konten untuk halaman beranda
//   Widget _buildHomePageContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//           child: RichText(
//             text: TextSpan(
//               style: DefaultTextStyle.of(
//                 context,
//               ).style.copyWith(fontSize: 22, color: Colors.black87),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: 'Selamat Datang, ',
//                   style: TextStyle(color: Colors.grey[700]),
//                 ),
//                 TextSpan(
//                   text: '$_namaPengguna!',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green, // Warna nama pengguna
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Text(
//             'Laporan sampah yang perlu Anda tangani:',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//         ),
//         Expanded(
//           child:
//               _laporanSampah.isEmpty
//                   ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.check_circle_outline,
//                           size: 80,
//                           color: Colors.green[400],
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           'Tidak ada laporan sampah yang perlu diambil saat ini.\nTerima kasih atas kerja keras Anda!',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 18, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   )
//                   : ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: _laporanSampah.length,
//                     itemBuilder: (context, index) {
//                       final laporan = _laporanSampah[index];
//                       return Card(
//                         margin: const EdgeInsets.only(bottom: 16.0),
//                         elevation: 4.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Gambar laporan sampah
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     child: Image.network(
//                                       laporan['gambar_url']!,
//                                       width: 80,
//                                       height: 80,
//                                       fit: BoxFit.cover,
//                                       errorBuilder: (
//                                         context,
//                                         error,
//                                         stackTrace,
//                                       ) {
//                                         return Container(
//                                           width: 80,
//                                           height: 80,
//                                           color: Colors.grey[300],
//                                           child: const Icon(
//                                             Icons.broken_image,
//                                             color: Colors.grey,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   const SizedBox(width: 16.0),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'ID Laporan: ${laporan['id']}',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.grey[600],
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 4.0),
//                                         Text(
//                                           laporan['lokasi']!,
//                                           style: const TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black87,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 8.0),
//                                         Row(
//                                           children: [
//                                             Icon(
//                                               Icons.category,
//                                               size: 16,
//                                               color: Colors.grey[600],
//                                             ),
//                                             const SizedBox(width: 4.0),
//                                             Text(
//                                               laporan['jenis_sampah']!,
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.grey[700],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 4.0),
//                                         Row(
//                                           children: [
//                                             Icon(
//                                               Icons.calendar_today,
//                                               size: 16,
//                                               color: Colors.grey[600],
//                                             ),
//                                             const SizedBox(width: 4.0),
//                                             Text(
//                                               laporan['tanggal']!,
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.grey[700],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Divider(height: 24, thickness: 1),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                       vertical: 5,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       // Menggunakan fungsi helper untuk warna latar belakang
//                                       color: _getStatusColor(
//                                         laporan['status']!,
//                                       ),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Text(
//                                       laporan['status']!,
//                                       style: TextStyle(
//                                         // Menggunakan fungsi helper untuk warna teks
//                                         color: _getStatusTextColor(
//                                           laporan['status']!,
//                                         ),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                                   ElevatedButton.icon(
//                                     onPressed: () {
//                                       // Aksi saat tombol "Lihat Detail" ditekan
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder:
//                                               (context) => DetailLaporanPage(
//                                                 laporanData:
//                                                     laporan, // Meneruskan seluruh data laporan ke halaman detail
//                                               ),
//                                         ),
//                                       );
//                                     },
//                                     icon: const Icon(Icons.arrow_forward),
//                                     label: const Text('Lihat Detail'),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                           Colors
//                                               .green, // Warna tombol yang kohesif dengan tema
//                                       foregroundColor: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           8.0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           // Ubah judul AppBar berdasarkan halaman yang dipilih
//           _selectedIndex == 0
//               ? 'Lapor Sampah'
//               : (_selectedIndex == 1 ? 'Riwayat' : 'Statistik'),
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.green[700],
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               // Aksi saat tombol notifikasi ditekan
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.account_circle, color: Colors.white),
//             onPressed: () {
//               // Aksi saat tombol profil ditekan
//             },
//           ),
//         ],
//       ),
//       body: _widgetOptions.elementAt(
//         _selectedIndex,
//       ), // Menampilkan widget sesuai indeks terpilih
//       floatingActionButton:
//           _selectedIndex == 0
//               ? FloatingActionButton.extended(
//                 // Hanya tampilkan di halaman Beranda
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const NewReportFormPage(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.add, color: Colors.white),
//                 label: const Text(
//                   'Lapor Sampah Baru',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 backgroundColor: Colors.green[600], // Warna tombol FAB
//               )
//               : null, // Set null jika bukan halaman beranda
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       // bottomNavigationBar: CustomButtomNavBar(
//       //   selectedIndex: _selectedIndex,
//       //   onItemTapped: (index) {
//       //     setState(() {
//       //       _selectedIndex = index;
//       //     });
//       //   },
//       // ),
//     );
//   }
// }
