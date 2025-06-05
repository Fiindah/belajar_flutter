// ignore_for_file: public_member_api_docs, sort_constructors_first
class Siswa {
  final int? id;
  final String nama;
  final String umur;
  Siswa({this.id, required this.nama, required this.umur});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'nama': nama, 'umur': umur};
  }

  factory Siswa.fromMap(Map<String, dynamic> map) {
    return Siswa(
      id: map['id'] as int,
      nama: map['nama'] as String,
      umur: map['umur'] as String,
    );
  }
}
