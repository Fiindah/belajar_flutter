import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelJadwal {
  final int? id;
  final String asal;
  final String tujuan;
  final String? tanggal;
  final String? jam;
  ModelJadwal({
    this.id,
    required this.asal,
    required this.tujuan,
    this.tanggal,
    this.jam,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'asal': asal,
      'tujuan': tujuan,
      'tanggal': tanggal,
      'jam': jam,
    };
  }

  factory ModelJadwal.fromMap(Map<String, dynamic> map) {
    return ModelJadwal(
      id: map['id'] != null ? map['id'] as int : null,
      asal: map['asal'] as String,
      tujuan: map['tujuan'] as String,
      tanggal: map['tanggal'] != null ? map['tanggal'] as String : null,
      jam: map['jam'] != null ? map['jam'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelJadwal.fromJson(String source) =>
      ModelJadwal.fromMap(json.decode(source) as Map<String, dynamic>);
}
